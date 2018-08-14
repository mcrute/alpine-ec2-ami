# Alpine Linux EC2 AMI Build

**NOTE: This is not an official Amazon or AWS provided image. This is community
built and supported.**

This repository contains a packer file and a script to create an EC2 AMI
containing Alpine Linux. The AMI is designed to work with most EC2 features
such as Elastic Network Adapters and NVME EBS volumes by default. If anything
is missing please report a bug.

This image can be launched on any modern instance type. Including T2, M5, C5,
I3, R4, P2, P3, X1, X1e, D2. Other instances may also work but have not been
tested. If you find an issue with instance support for any current generation
instance please file a bug against this project.

To get started use one of the AMIs below. The default user is `alpine` and will
be configured to use whatever SSH keys you chose when you launched the image.
If user data is specified it must be a shell script that begins with `#!`. If a
script is provided it will be executed as root after the network is configured.

**Note:** This image will be updated as Alpine Linux changes over time and as
AWS adds regions. This file and
[release.yaml](https://github.com/mcrute/alpine-ec2-ami/blob/master/release.yaml)
will be updated as new regions are made available.

| Alpine Version | Region Code | AMI ID |
| -------------- | ----------- | ------ |
| 3.7 | ap-southeast-2 | [ami-7628d814](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-7628d814) |
| 3.7 | sa-east-1 | [ami-ae5414c2](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-ae5414c2) |
| 3.7 | us-west-2 | [ami-e474db9c](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-e474db9c) |
| 3.7 | eu-central-1 | [ami-a96ff8c6](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-a96ff8c6) |
| 3.7 | eu-west-2 | [ami-9ea2bbfa](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-9ea2bbfa) |
| 3.7 | ap-south-1 | [ami-29c28846](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-29c28846) |
| 3.7 | eu-west-1 | [ami-66de501f](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-66de501f) |
| 3.7 | us-east-1 | [ami-976020ed](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-976020ed) |
| 3.7 | us-west-1 | [ami-1c393f7c](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-1c393f7c) |
| 3.7 | ap-northeast-2 | [ami-b96ccdd7](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-b96ccdd7) |
| 3.7 | ap-northeast-1 | [ami-361c8850](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-361c8850) |
| 3.7 | us-east-2 | [ami-c487afa1](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-c487afa1) |
| 3.7 | ap-southeast-1 | [ami-25a8c059](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-25a8c059) |
| 3.7 | ca-central-1 | [ami-293d874d](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-293d874d) |

## Caveats

This image is being used in production but it's still somewhat early stage in
its development and thus there are some sharp edges.

- Only EBS-backed HVM instances are supported. While paravirtualized instances
  are still available from AWS they are not supported on any of the newer
  hardware so it seems unlikely that they will be supported going forward. Thus
  this project does not support them.

- The aws-ena-driver-vanilla package is still in edge/testing.  When it is
  available in a release, the edge/testing repository can be removed from
  /etc/apk/repositories.

- [cloud-init](https://cloudinit.readthedocs.io/en/latest/) is not currently
  supported on Alpine Linux. Instead this image uses
  [tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap). Hostname
  setting will work as will setting the ssh keys for the Alpine user based on
  what was configured during instance launch. User data is supported as long
  as it's a shell script (starts with #!). See the tiny-ec2-bootstrap README
  for more details. You can still install cloud-init using aports but the
  version in the tree is somewhat old and may not work correctly for Alpine.
  If full cloud-init support is important to you please file a bug against this
  project.

- CloudFormation support is still forthcoming. This requires patches and
  packaging for the upstream cfn tools that have not yet been accepted.
  Eventually full CloudFormation support will be available.
