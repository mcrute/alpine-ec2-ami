# Alpine Linux EC2 AMI Build

**NOTE: This is not an official Amazon or AWS provided image.  This is
community built and supported.**

This repository contains a packer file and a script to create an EC2 AMI
containing Alpine Linux.  The AMI is designed to work with most EC2 features
such as Elastic Network Adapters and NVME EBS volumes by default.  If anything
is missing please report a bug.

This image can be launched on any modern x86_64 instance type, including T3,
M5, C5, I3, R5, P3, X1, X1e, D2, Z1d.  Other instances may also work but have
not been tested.  If you find an issue with instance support for any current
generation instance please file a bug against this project.

To get started use one of the AMIs below.  The default user is `alpine` and
will be configured to use whatever SSH keys you chose when you launched the
image.  If user data is specified it must be a shell script that begins with
`#!`.  If a script is provided it will be executed as root after the network is
configured.

**NOTE:** *We are working to automate AMI builds and updates to this file and
[release.yaml](https://github.com/mcrute/alpine-ec2-ami/blob/master/release.yaml)
in the not-too-distant future.*

| Alpine Release | Region Code | AMI ID |
| :------------: | ----------- | ------ |
| 3.9.2 | ap-northeast-1 | [ami-09d219b1c464db917](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09d219b1c464db917) |
| 3.9.2 | ap-northeast-2 | [ami-043701e133b99f4c4](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-043701e133b99f4c4) |
| 3.9.2 | ap-south-1 | [ami-006cb3cc1e86815e8](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-006cb3cc1e86815e8) |
| 3.9.2 | ap-southeast-1 | [ami-0a5d51100fbad6534](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a5d51100fbad6534) |
| 3.9.2 | ap-southeast-2 | [ami-082a9d093a693e412](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-082a9d093a693e412) |
| 3.9.2 | ca-central-1 | [ami-0ec17b6f3076af75c](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ec17b6f3076af75c) |
| 3.9.2 | eu-central-1 | [ami-0cb14722a657df41b](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0cb14722a657df41b) |
| 3.9.2 | eu-north-1 | [ami-0ab528159f4fdc29f](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ab528159f4fdc29f) |
| 3.9.2 | eu-west-1 | [ami-09411a0f755d83b85](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09411a0f755d83b85) |
| 3.9.2 | eu-west-2 | [ami-0d41697972c9b8bc0](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d41697972c9b8bc0) |
| 3.9.2 | eu-west-3 | [ami-01d74bb07689bda40](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-01d74bb07689bda40) |
| 3.9.2 | sa-east-1 | [ami-02f2c79c63d1f4a41](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02f2c79c63d1f4a41) |
| 3.9.2 | us-east-1 | [ami-0fe2769f64d520d1c](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0fe2769f64d520d1c) |
| 3.9.2 | us-east-2 | [ami-0065dce2cc30e41f5](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0065dce2cc30e41f5) |
| 3.9.2 | us-west-1 | [ami-0cb6df99641faedde](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0cb6df99641faedde) |
| 3.9.2 | us-west-2 | [ami-0d41eeb15d6f487e4](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d41eeb15d6f487e4) |

## Caveats

This image is being used in production but it's still somewhat early stage in
its development and thus there are some sharp edges.

- As of 3.9.0-1, this AMI starts `haveged` at the boot runlevel, to provide
  additional initial entropy as discussed in issue #39.  In the long term, we
  hope to find an alternative solution.

- Only EBS-backed HVM instances are supported.  While paravirtualized instances
  are still available from AWS they are not supported on any of the newer
  hardware so it seems unlikely that they will be supported going forward.
  Thus this project does not support them.

- [cloud-init](https://cloudinit.readthedocs.io/en/latest/) is not currently
  supported on Alpine Linux.  Instead this image uses
  [tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap).  Hostname
  setting will work, as will setting the ssh keys for the Alpine user based on
  what was configured during instance launch.  User data is supported as long
  as it's a shell script (starts with #!).  See the tiny-ec2-bootstrap README
  for more details.  You can still install cloud-init (from the edge testing
  repositories), but we haven't tested whether it will work correctly for this
  AMI.  If full cloud-init support is important to you please file a bug
  against this project.

- CloudFormation support is still forthcoming.  This requires patches and
  packaging for the upstream cfn tools that have not yet been accepted.
  Eventually full CloudFormation support will be available.
