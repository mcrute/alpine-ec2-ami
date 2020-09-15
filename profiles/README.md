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
meant to be directly used like target profiles with the `builder.py` script.

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
used with `./scripts/builder.py`; they must have a `.conf` suffix.  Several
configuration objects are defined and later merged within the `BUILDS` object,
ultimately defining each individual build.

Simple profiles have an object that loads a "version" core profile and
another that loads an "arch" core profile.  A more complicated version-arch
matrix profile would have an object for each version and arch.

Additionally, there are one or more objects that define profile-specific
settings.

The `BUILDS` object's elements merge core and profile configs (with optional
inline build settings) into named build definitions; these build names can be
used to specify a subset of a profile's builds, for example:
`./scripts/builder.py amis <profile> <build1> <build2> ...`

**Please note that merge order matters!**  The merge sequence is version -->
architecture --> profile --> build.

## Customization

If the AWS configuration you're using does not specify a default region, your
custom profile will need to specify `build_region`.  If the build region does
not have a default VPC, you'll need to specify `build_subnet`.

`version` and `release` are meant to match Alpine; however, `revision` is used
used to track changes to the profile, additions of new
[alpine-ec2-ami](https://github.com/mcrute/alpine-ec2-ami) features,
or other situations where the AMIs needs to be rebuilt.  The "edge" core
version profile sets `revision` to null, which translates into the current
datetime.  Otherwise, the default set in the base profile is `r0`.

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
from an encrypted AMI results in an encrypted EBS root volume.  Please note
that if your AMI is encrypted, only the owning account will be able to use it.

_*NOTE*: The following funcitonality that is currently not operational -- it
is pending completion and integration of a new release tool.  In the meantime,
you will have to manually copy AMIs from the build region to other regions._

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

By default, the AMIs built are accessible only by the owning account.  To
make your AMIs publicly available, set the `ami_access` hash variable:
```
ami_access {
  all = true
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
variable.  Its first-level keys are names of runlevels (`sysinit`, `boot`,
`default`, and `shutown`), and the second-level keys are the services, as they
appear in `/etc/init.d`.  Like the other profile hash variables, setting
`false` or `null` disable the service in the runlevel, `true` will enable the
service.

Further customization can be done by specifying your own setup script with the
`setup_script` profile variable.  This will be copied to the build instance at
`/tmp/setup-ami.d/setup_script`, and executed by the `setup-ami` script just
before the final cleanup phase.

If there are additional data or scripts that your setup script uses, use the
`setup_copy` hash variable -- the key is the destination path under the build
instance's `/tmp/setup-ami.d` directory, and the value is the local path to
the source file or directory.  No data is automatically installed in the AMI,
and no additional scripts are executed -- you must explicitly install/execute
via the `setup_script` script.

The AMI's default login user is `alpine`.  If you want to specify a alternate
login, set it with the `ami_user` profile variable.  This setting is saved in
`/etc/conf.d/tiny-ec2-bootstrap` as `EC2_USER` and
[tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap)
will use that valie instead of `alpine`.

## Limitations and Caveats

* Hash variables that are reset to clear inherited values *must* be
  re-defined as a hash, even if it is to remain empty:
  ```
  hash_var = null   # drops inherited values
  hash_var {}       # re-defines as an empty hash
  ```
