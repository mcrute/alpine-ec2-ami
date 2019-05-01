#!/bin/sh
# vim: set ts=4 et:

set -eu

# what bootloader should we use?
[ -d "/sys/firmware/efi" ] && BOOTLOADER=grub-efi || BOOTLOADER=syslinux

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
    local tarball="$(basename $APK_TOOLS)"

    wgets "$APK_TOOLS" "$APK_TOOLS_SHA256" "$store/$tarball"
    tar -C "$store" -xf "$store/$tarball"

    find "$store" -name apk
}

# mostly from Alpine's /sbin/setup-disk
setup_partitions() {
    # TODO: do we really need to waste 1M?
    local diskdev="$1" start=1M line=
    shift

    # create new partitions
    (
        for line in "$@"; do
            case "$line" in
            0M*) ;;
            *) echo "$start,$line"; start= ;;
            esac
        done
    ) | sfdisk --quiet --label dos $diskdev

    # we assume that the build host will create the new devices within 5s
    local tries=5
    while [ ! -e "${diskdev}1" ]; do
        [ $tries -eq 0 ] && break || sleep 1
        tries=$(( $tries - 1 ))
    done
    [ -e "${diskdev}1" ] || die "Expected new device ${diskdev}1 not created"
}

make_filesystem() {
    local device="$1"   # target device path
    local root_dev="$1" # root partition
    local target="$2"   # mount target
    local efi_dev=      # EFI partition

    if [ "$BOOTLOADER" = 'grub-efi' ]; then
        # create a small EFI partition (remainder for root), and format it
        setup_partitions "$device" '5M,EF' ',L'
        efi_dev="${device}1"
        root_dev="${device}2"
        mkfs.vfat -n EFI "${device}1"
    fi

    mkfs.ext4 -O ^64bit -L / "$root_dev"
    mount "$root_dev" "$target"

    if [ "$BOOTLOADER" = 'grub-efi' ]; then
        mkdir -p "$target"/boot/efi
        mount -t vfat "$efi_dev" "$target"/boot/efi
    fi
    # TODO? return "$root_dev"
}

setup_repositories() {
    local target="$1"   # target directory

    mkdir -p "$target"/etc/apk/keys
    echo "$REPOS" > "$target"/etc/apk/repositories
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

    chroot "$target" apk --no-cache add $PKGS

    chroot "$target" apk --no-cache add --no-scripts $BOOTLOADER

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

    # Enable ENA and NVME features these don't hurt for any instance and are
    # hard requirements of the 5 series and i3 series of instances
    # TODO: profile-ize?
    sed -Ei 's/^features="([^"]+)"/features="\1 nvme ena"/' \
        "$target"/etc/mkinitfs/mkinitfs.conf

    chroot "$target" /sbin/mkinitfs $(basename $(find "$target"/lib/modules/* -maxdepth 0))
}

install_bootloader() {
    local target="$1"
    case "$BOOTLOADER" in
        syslinux)   install_extlinux "$target" ;;
        grub-efi)   install_grub_efi "$target" ;;
        *)          die "unknown bootloader '$BOOTLOADER'" ;;
    esac
}

install_extlinux() {
    local target="$1"

    # Must use disk labels instead of UUID or devices paths so that this works
    # across instance familes. UUID works for many instances but breaks on the
    # NVME ones because EBS volumes are hidden behind NVME devices.
    #
    # Enable ext4 because the root device is formatted ext4
    #
    # Shorten timeout (1/10s) as EC2 has no way to interact with instance console
    #
    # ttyS0 is the target for EC2s "Get System Log" feature whereas tty0 is the
    # target for EC2s "Get Instance Screenshot" feature. Enabling the serial
    # port early in extlinux gives the most complete output in the system log.
    sed -Ei -e "s|^[# ]*(root)=.*|\1=LABEL=/|" \
        -e "s|^[# ]*(default_kernel_opts)=.*|\1=\"$KERNEL_OPTS\"|" \
        -e "s|^[# ]*(serial_port)=.*|\1=ttyS0|" \
        -e "s|^[# ]*(modules)=.*|\1=$KERNEL_MODS|" \
        -e "s|^[# ]*(default)=.*|\1=virt|" \
        -e "s|^[# ]*(timeout)=.*|\1=1|" \
        "$target"/etc/update-extlinux.conf

    chroot "$target" /sbin/extlinux --install /boot
    chroot "$target" /sbin/update-extlinux --warn-only
}

install_grub_efi() {
    local target="$1"

    case "$ARCH" in
        x86_64)     grub_target=x86_64-efi ; fwa=x64 ;;
        aarch64)    grub_target=arm64-efi ; fwa=aa64 ;;
        *)          die "ARCH=$ARCH is currently unsupported" ;;
    esac

    # TODO: this should be set up when we mkfs/mount
    #mkdir -p "$target"/boot/efi

    # disable nvram so grub doesn't call efibootmgr
    chroot "$target" /usr/sbin/grub-install --target=$grub_target --efi-directory=/boot/efi \
        --bootloader-id=alpine --boot-directory=/boot --no-nvram

    # fallback mode
    install -D "$target"/boot/efi/EFI/alpine/grub$fwa.efi "$target"/boot/efi/EFI/boot/$fwa.efi

    # add cmdline linux defaults to /etc/default/grub
    echo "GRUB_CMDLINE_LINUX_DEFAULT=\"modules=$KERNEL_MODS $KERNEL_OPTS\"" >> "$target"/etc/default/grub

    # eliminate grub pause
    sed -ie 's/^GRUB_TIMEOUT=.$/GRUB_TIMEOUT=0/' "$target"/etc/default/grub

    # generate/install new config
    [ -e "$target"/boot/grub/grub.cfg ] && cp "$target"/boot/grub/grub.cfg "$target"/boot/grub/grub.cfg.backup
    chroot "$target" grub-mkconfig -o /boot/grub/grub.cfg
}

setup_fstab() {
    local target="$1"

    cat > "$target"/etc/fstab <<EOF
# <fs>      <mountpoint>   <type>   <opts>              <dump/pass>
LABEL=/     /              ext4     defaults,noatime    1 1
EOF

    # if we're using grub-efi bootloader, add extra line for EFI partition
    if [ "$BOOTLOADER" = 'grub-efi' ]; then
        echo "LABEL=EFI   /boot/efi      vfat     defaults,noatime,uid=0,gid=0,umask=077  0 0" >> "$target"/etc/fstab
    fi
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

    local lvl_svcs; for lvl_svcs in $SVCS; do
        rc_add "$target" $(echo "$lvl_svcs" | tr =, ' ')
    done
}

# TODO: allow profile to specify alternate ALPINE_USER?
# NOTE: tiny-ec2-bootstrap will need to be updated to support that!
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

    [ "$BOOTLOADER" = 'grub-efi' ] && umount "$target"/boot/efi

    umount \
        "$target"/dev \
        "$target"/proc \
        "$target"/sys

    umount "$target"
}

main() {
    local device="/dev/xvdf"
    local target="/mnt/target"

    validate_block_device "$device"

    [ -d "$target" ] || mkdir "$target"

    einfo "Fetching static APK tools"
    apk="$(fetch_apk_tools)"

    einfo "Creating root filesystem"
    make_filesystem "$device" "$target"

    einfo "Configuring Alpine repositories"
    setup_repositories "$target"

    einfo "Fetching Alpine signing keys"
    fetch_keys "$target"

    einfo "Installing base system"
    install_base "$target"

    setup_chroot "$target"

    einfo "Installing core packages"
    install_core_packages "$target"

    einfo "Configuring and enabling boot loader"
    create_initfs "$target"
    install_bootloader "$target"

    einfo "Configuring system"
    setup_mdev "$target"
    setup_fstab "$target"
    setup_networking "$target"
    enable_services "$target"
    create_alpine_user "$target"
    configure_ntp "$target"

    einfo "All done, cleaning up"
    cleanup "$target"
}

main "$@"
