#!/bin/sh

set -ex

# Backports tiny-ec2-bootstrap 1.4.1 to Alpine 3.12 and earlier.  This fixes
# resizing the root partition on aarch64 AMIs, and is NOT NECESSARY FOR x86_64.
#
# The build profile should also include the following dependencies...
#
#   pkgs {
#     sfdisk = true
#     util-linux = true
#   }
#

TINY_EC2_BOOTSTRAP_VERSION=1.4.1
TINY_EC2_BOOTSTRAP_URL="$(printf \
  https://raw.githubusercontent.com/mcrute/tiny-ec2-bootstrap/release-%s/tiny-ec2-bootstrap \
  "${TINY_EC2_BOOTSTRAP_VERSION}"
)"

wget "$TINY_EC2_BOOTSTRAP_URL"
chmod +x tiny-ec2-bootstrap
cp -a tiny-ec2-bootstrap "$TARGET"/etc/init.d
