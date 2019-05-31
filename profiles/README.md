# Profiles

Profiles are collections of related build definitions, which are used to
generate the `vars.json` files that [Packer](https://packer.io) consumes
when building AMIs.

Profiles use [HOCON](https://github.com/lightbend/config/blob/master/HOCON.md)
(Human-Optimized Config Object Notation) which allows importing common configs
from other files, simple variable interpolation, and easy merging of objects.
This flexibility helps keep configuration for related build targets
[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

## Core Profiles

Core profile configurations are found in the `base`, `version`, and `arch`
subdirectories.  Core profiles do not have a `.conf` suffix because they're not
meant to be directly used like target profiles with `make`.

Base core profiles define all build vars with default values -- those left
empty or null are usually set in version, arch, or target profile configs.
Base profiles are included in version profiles, and do not need to be included
in target profiles.

Version core profiles expand on the base profile they include, and set the
`version`, `release`, `end_of_life` (if known), and the associated Alpine Linux
`repos`.

Arch core profiles further define architecture-specific variables, such as
which `apk-tools` and `alpine-keys` to use (and their SHA256 checksums).

## Target Profiles

Target profiles, defined in this directory, are the top-level configuration
used with `make PROFILE=<profile>`; they must have a `.conf` suffix.  Several
configuration objects are defined and later merged within the `BUILDS` object,
ultimately defining each individual build.

Simple profiles have an object that loads a "version" core profile and
another that loads an "arch" core profile.  A more complicated version-arch
matrix profile would have an object for each version and arch.

Additionally, there are one or more objects that define profile-specific
settings.

The `BUILDS` object's elements merge core and profile configs (with optional
inline build settings) into named build definitions; these build names can be
used to specify a subset of a profile's builds:
`make PROFILE=<profile> BUILDS="<build> ..."`

**Please note that merge order matters!**  The merge sequence is version -->
architecture --> profile --> build.

## Customization

The most important variables to set in your custom profile is `build_region`
and `build_subnet`.  Without these, Packer will not know where to build.

`version` and `release` are meant to match Alpine; however,`revision` can be
used to track changes to profile or situations where the AMIs needed to be
rebuilt.  The "edge" core version profile sets `revision` to the current
datetime, otherwise the default is `r0`.

You will probably want to personalize the name and description of your AMI.
Set `ami_name_prefix` and `ami_name_suffix`; setting `ami_desc_suffix` and
`ami_desc_suffix` is optional.

Set `build_instance_type` if you want/need to use a different instance type to
build the image; the default is `t3.nano`.

If 1 GiB is not enough to install the packages in your base AMI, you can set
the `ami_volume_size` to the number of GiB you need.  Note, however, that the
[tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap) init script
will expand the root partition to use the instance's entire EBS root volume
during the first boot, so you shouldn't need to make space for anything other
than installed packages.

Set `ami_encrypt` to "true" to create an encrypted AMI image.  Launching images
from an encrypted AMI results in an encrypted EBS root volume.

To copy newly built AMIs to regions other than the `build_region` region, set
`ami_regions`.  This variable is a *hash*, which allows for finer control over
inherited values when merging configs.  Region identifiers are the keys, a
value of `true` means the AMI should be copied to that region; `null` or
`false` indicate that it shouldn't be copied to that region.  If you want to
ensure that the `ami_regions` hash does not inherit any values, set it to
`null` before configuring your regions.  For example:
```
ami_regions = null   # don't inherit any previous values
ami_regions {
  us-west-2   = true
  eu-north-1  = true
}
```

Controlling what packages are installed and enabled in the AMI is the number
one reason for creating custom profile.  The `repos`, `pkgs`, and `svcs` hash
variables serve precisely that purpose.  With some exceptions (noted below),
they work the same as the `ami_regions` hash: `true` values enable, `false`
and `null` values disable, and inherited values can be cleared by first setting
the variable itself to `null`.

With `repos`, the keys are double-quoted URLs to the `apk` repos that you want
set up; these are initially set in the "version" core profiles.  In addition
to the `true`, `false`, and `null` values, you can also use a "repo alias"
string value, allowing you to pin packages to be sourced from that particular
repo.  For example, with a profile based from a non-edge core profile, you may
want to be able to pull packages from the edge testing repo:
```
repos {
  "http://dl-cdn.alpinelinux.org/alpine/edge/testing" = "edge-testing"
}
```

The `pkgs` hash's default is set in the base core profile; its keys are
simply the Alpine package to install (or not install, if the value is `false`
or `null`).  A `true` value installs the package from the default repos; if the
value is a repo alias string, the package will be pinned to explicitly install
from that repo.  For example:
```
pkgs {
  # install docker-compose from edge-testing repo
  docker-compose = "edge-testing"
}
```

To control when (or whether) a system service starts, use the `svcs` hash
variable.  Its keys are the service names, as they appear in `/etc/init.d`;
default values are set in the base core profile.  Like the other hash
variables, setting `false` or `null` disable the service, `true` will enable
the service at the "default" runlevel.  The service can be enabled at a
different runlevel by using that runlevel as the value.

By default, the AMIs built are accessible only by the owning account.  To
make your AMIs publicly available, set the `ami_access` hash variable:
```
ami_access {
  all = true
}
```

## Limitations and Caveats

* Hash variables that are reset to clear inherited values *must* be
  re-defined as a hash, even if it is to remain empty:
  ```
  hash_var = null   # drops inherited values
  hash_var {}       # re-defines as an empty hash
  ```

* The AMI's login user is currently hard coded to be `alpine`.  Changes to
  [tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap) are
  required before we can truly make `ami_user` configurable.
