#!/bin/sh
# vim: set ts=4 et:

set -eu

MIN_VERSION="3.9"
MIN_RELEASE="3.9.0"

: ${VERSION:="${MIN_VERSION}"}   # unless otherwise specified
: ${RELEASE:="${MIN_RELEASE}"}   # unless otherwise specified

: ${APK_TOOLS_URI:="https://github.com/alpinelinux/apk-tools/releases/download/v2.10.3/apk-tools-2.10.3-x86_64-linux.tar.gz"}
: ${APK_TOOLS_SHA256:="4d0b2cda606720624589e6171c374ec6d138867e03576d9f518dddde85c33839"}
: ${ALPINE_KEYS:="http://dl-cdn.alpinelinux.org/alpine/v3.9/main/x86_64/alpine-keys-2.1-r1.apk"}
: ${ALPINE_KEYS_SHA256:="9c7bc5d2e24c36982da7aa49b3cfcb8d13b20f7a03720f25625fa821225f5fbc"}

die() {
    printf '\033[1;31mERROR:\033[0m %s\n' "$@" >&2  # bold red
    exit 1
}

einfo() {
    printf '\n\033[1;36m> %s\033[0m\n' "$@" >&2  # bold cyan
}

rc_add() {
    local target="$1"; shift    # target directory
    local runlevel="$1"; shift  # runlevel name
    local services="$*"         # names of services

    local svc; for svc in $services; do
        mkdir -p "$target"/etc/runlevels/$runlevel
        ln -s /etc/init.d/$svc "$target"/etc/runlevels/$runlevel/$svc
        echo " * service $svc added to runlevel $runlevel"
    done
}

wgets() (
    local url="$1"     # url to fetch
    local sha256="$2"  # expected SHA256 sum of output
    local dest="$3"    # output path and filename

    wget -T 10 -q -O "$dest" "$url"
    echo "$sha256  $dest" | sha256sum -c > /dev/null
)


validate_block_device() {
    local dev="$1"  # target directory

    lsblk -P --fs "$dev" >/dev/null 2>&1 || \
        die "'$dev' is not a valid block device"

    if lsblk -P --fs "$dev" | grep -vq 'FSTYPE=""'; then
        die "Block device '$dev' is not blank"
    fi
}

fetch_apk_tools() {
    local store="$(mktemp -d)"
    local tarball="$(basename $APK_TOOLS_URI)"

    wgets "$APK_TOOLS_URI" "$APK_TOOLS_SHA256" "$store/$tarball"
    tar -C "$store" -xf "$store/$tarball"

    find "$store" -name apk
}

make_filesystem() {
    local device="$1"  # target device path
    local target="$2"  # mount target

    mkfs.ext4 -O ^64bit "$device"
    e2label "$device" /
    mount "$device" "$target"
}

setup_repositories() {
    local target="$1"     # target directory
    local add_repos="$2"  # extra repo lines, comma separated

    mkdir -p "$target"/etc/apk/keys

    if [ "$VERSION" = 'edge' ]; then
        cat > "$target"/etc/apk/repositories <<EOF
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
http://dl-cdn.alpinelinux.org/alpine/edge/testing
EOF
    else
        cat > "$target"/etc/apk/repositories <<EOF
http://dl-cdn.alpinelinux.org/alpine/v$VERSION/main
http://dl-cdn.alpinelinux.org/alpine/v$VERSION/community
EOF
    fi

    echo "$add_repos" | tr , "\012" >> "$target"/etc/apk/repositories
}

fetch_keys() {
    local target="$1"
    local tmp="$(mktemp -d)"

    wgets "$ALPINE_KEYS" "$ALPINE_KEYS_SHA256" "$tmp/alpine-keys.apk"
    tar -C "$target" -xvf "$tmp"/alpine-keys.apk etc/apk/keys
    rm -rf "$tmp"
}

install_base() {
    local target="$1"

    $apk add --root "$target" --no-cache --initdb alpine-base
    # verify release matches
    if [ "$VERSION" != "edge" ]; then
        ALPINE_RELEASE=$(cat "$target/etc/alpine-release")
        [ "$RELEASE" = "$ALPINE_RELEASE" ] || \
            die "Current Alpine $VERSION release ($ALPINE_RELEASE) does not match build ($RELEASE)"
    fi
}

setup_chroot() {
    local target="$1"

    mount -t proc none "$target"/proc
    mount --bind /dev "$target"/dev
    mount --bind /sys "$target"/sys

    # Don't want to ship this but it's needed for bootstrap. Will be removed in
    # the cleanup stage.
    install -Dm644 /etc/resolv.conf "$target"/etc/resolv.conf
}

install_core_packages() {
    local target="$1"    # target directory
    local add_pkgs="$2"  # extra packages, space separated

    # Most from: https://git.alpinelinux.org/cgit/alpine-iso/tree/alpine-virt.packages
    #
    # sudo - to allow alpine user to become root, disallow root SSH logins
    # tiny-ec2-bootstrap - to bootstrap system from EC2 metadata
    #
    chroot "$target" apk --no-cache add \
        linux-virt \
        alpine-mirrors \
        nvme-cli \
        chrony \
        openssh \
        sudo \
        tiny-ec2-bootstrap \
        tzdata \
        $(echo "$add_pkgs" | tr , ' ')

    chroot "$target" apk --no-cache add --no-scripts syslinux

    # Disable starting getty for physical ttys because they're all inaccessible
    # anyhow. With this configuration boot messages will still display in the
    # EC2 console.
    sed -Ei '/^tty[0-9]/s/^/#/' \
        "$target"/etc/inittab

    # Make it a little more obvious who is logged in by adding username to the
    # prompt
    sed -i "s/^export PS1='/&\\\\u@/" "$target"/etc/profile
}

setup_mdev() {
    local target="$1"

    cp /tmp/nvme-ebs-links "$target"/lib/mdev
    sed -n -i -e '/# fallback/r /tmp/nvme-ebs-mdev.conf' -e 1x -e '2,${x;p}' -e '${x;p}' "$target"/etc/mdev.conf
}

create_initfs() {
    local target="$1"

    # Create ENA feature for mkinitfs
    echo "kernel/drivers/net/ethernet/amazon" > \
        "$target"/etc/mkinitfs/features.d/ena.modules

    # Enable ENA and NVME features these don't hurt for any instance and are
    # hard requirements of the 5 series and i3 series of instances
    sed -Ei 's/^features="([^"]+)"/features="\1 nvme ena"/' \
        "$target"/etc/mkinitfs/mkinitfs.conf

    chroot "$target" /sbin/mkinitfs $(basename $(find "$target"/lib/modules/* -maxdepth 0))
}

setup_extlinux() {
    local target="$1"

    # Must use disk labels instead of UUID or devices paths so that this works
    # across instance familes. UUID works for many instances but breaks on the
    # NVME ones because EBS volumes are hidden behind NVME devices.
    #
    # Enable ext4 because the root device is formatted ext4
    #
    # Shorten timeout because EC2 has no way to interact with instance console
    #
    # ttyS0 is the target for EC2s "Get System Log" feature whereas tty0 is the
    # target for EC2s "Get Instance Screenshot" feature. Enabling the serial
    # port early in extlinux gives the most complete output in the system log.
    sed -Ei -e "s|^[# ]*(root)=.*|\1=LABEL=/|" \
        -e "s|^[# ]*(default_kernel_opts)=.*|\1=\"console=ttyS0 console=tty0\"|" \
        -e "s|^[# ]*(serial_port)=.*|\1=ttyS0|" \
        -e "s|^[# ]*(modules)=.*|\1=sd-mod,usb-storage,ext4|" \
        -e "s|^[# ]*(default)=.*|\1=virt|" \
        -e "s|^[# ]*(timeout)=.*|\1=1|" \
        "$target"/etc/update-extlinux.conf
}

install_extlinux() {
    local target="$1"

    chroot "$target" /sbin/extlinux --install /boot
    chroot "$target" /sbin/update-extlinux --warn-only
}

setup_fstab() {
    local target="$1"

    cat > "$target"/etc/fstab <<EOF
# <fs>      <mountpoint>   <type>   <opts>              <dump/pass>
LABEL=/     /              ext4     defaults,noatime    1 1
EOF
}

setup_networking() {
    local target="$1"

    cat > "$target"/etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF
}

enable_services() {
    local target="$1"
    local add_svcs="$2"

    rc_add "$target" default sshd chronyd networking tiny-ec2-bootstrap
    rc_add "$target" sysinit devfs dmesg mdev hwdrivers
    rc_add "$target" boot modules hwclock swap hostname sysctl bootmisc syslog acpid
    rc_add "$target" shutdown killprocs savecache mount-ro

    if [ -n "$add_svcs" ]; then
        local lvl_svcs; for lvl_svcs in $(echo "$add_svcs" | tr : ' '); do
            rc_add "$target" $(echo "$lvl_svcs" | tr =, ' ')
        done
    fi
}

create_alpine_user() {
    local target="$1"

    # Allow members of the wheel group to sudo without a password. By default
    # this will only be the alpine user. This allows us to ship an AMI that is
    # accessible via SSH using the user's configured SSH keys (thanks to
    # tiny-ec2-bootstrap) but does not allow remote root access which is the
    # best-practice.
    sed -i '/%wheel .* NOPASSWD: .*/s/^# //' "$target"/etc/sudoers

    # There is no real standard ec2 username across AMIs, Amazon uses ec2-user
    # for their Amazon Linux AMIs but Ubuntu uses ubuntu, Fedora uses fedora,
    # etc... (see: https://alestic.com/2014/01/ec2-ssh-username/). So our user
    # and group are alpine because this is Alpine Linux. On instance bootstrap
    # the user can create whatever users they want and delete this one.
    chroot "$target" /usr/sbin/addgroup alpine
    chroot "$target" /usr/sbin/adduser -h /home/alpine -s /bin/sh -G alpine -D alpine
    chroot "$target" /usr/sbin/addgroup alpine wheel
    chroot "$target" /usr/bin/passwd -u alpine
}

configure_ntp() {
    local target="$1"

    # EC2 provides an instance-local NTP service syncronized with GPS and
    # atomic clocks in-region. Prefer this over external NTP hosts when running
    # in EC2.
    #
    # See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html
    sed -e 's/^pool /server /' \
        -e 's/pool.ntp.org/169.254.169.123/g' \
        -i "$target"/etc/chrony/chrony.conf
}

cleanup() {
    local target="$1"

    # Sweep cruft out of the image that doesn't need to ship or will be
    # re-generated when the image boots
    rm -f \
        "$target"/var/cache/apk/* \
        "$target"/etc/resolv.conf \
        "$target"/root/.ash_history \
        "$target"/etc/*-

    umount \
        "$target"/dev \
        "$target"/proc \
        "$target"/sys

    umount "$target"
}

version_sorted() {
    # falsey if $1 version > $2 version
    printf "%s\n%s" $1 $2 | sort -VC
}

main() {
    [ "$VERSION" != 'edge' ] && {
        version_sorted $MIN_VERSION $VERSION || die "Minimum Alpine version is '$MIN_RELEASE'"
        version_sorted $MIN_RELEASE $RELEASE || die "Minimum Alpine release is '$MIN_RELEASE'"
    }

    local add_repos="$ADD_REPOS"
    local add_pkgs="$ADD_PKGS"
    local add_svcs="$ADD_SVCS"

    local device="/dev/xvdf"
    local target="/mnt/target"

    validate_block_device "$device"

    [ -d "$target" ] || mkdir "$target"

    einfo "Fetching static APK tools"
    apk="$(fetch_apk_tools)"

    einfo "Creating root filesystem"
    make_filesystem "$device" "$target"

    einfo "Configuring Alpine repositories"
    setup_repositories "$target" "$add_repos"

    einfo "Fetching Alpine signing keys"
    fetch_keys "$target"

    einfo "Installing base system"
    install_base "$target"

    setup_chroot "$target"

    einfo "Installing core packages"
    install_core_packages "$target" "$add_pkgs"

    einfo "Configuring and enabling boot loader"
    create_initfs "$target"
    setup_extlinux "$target"
    install_extlinux "$target"

    einfo "Configuring system"
    setup_mdev "$target"
    setup_fstab "$target"
    setup_networking "$target"
    enable_services "$target" "$add_svcs"
    create_alpine_user "$target"
    configure_ntp "$target"

    einfo "All done, cleaning up"
    cleanup "$target"
}

main "$@"
