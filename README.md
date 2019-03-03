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
| 3.9.1 | ap-northeast-1 | [ami-0ea7c699bf8c8dbdb](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ea7c699bf8c8dbdb) |
| 3.9.1 | ap-northeast-2 | [ami-073bfec8980f57d41](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-073bfec8980f57d41) |
| 3.9.1 | ap-south-1 | [ami-0c305b2e446b07208](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c305b2e446b07208) |
| 3.9.1 | ap-southeast-1 | [ami-054428bd9a4f1da32](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-054428bd9a4f1da32) |
| 3.9.1 | ap-southeast-2 | [ami-0162473012357913f](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0162473012357913f) |
| 3.9.1 | ca-central-1 | [ami-034123f6e4bf47ebe](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-034123f6e4bf47ebe) |
| 3.9.1 | eu-central-1 | [ami-041e9f940aa47cc57](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-041e9f940aa47cc57) |
| 3.9.1 | eu-north-1 | [ami-02c9b9573dd51be66](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02c9b9573dd51be66) |
| 3.9.1 | eu-west-1 | [ami-08189341fffe63299](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08189341fffe63299) |
| 3.9.1 | eu-west-2 | [ami-0f77a3082ff94976e](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f77a3082ff94976e) |
| 3.9.1 | eu-west-3 | [ami-01a9f762e03dc71c4](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-01a9f762e03dc71c4) |
| 3.9.1 | sa-east-1 | [ami-074d84594f4b09480](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-074d84594f4b09480) |
| 3.9.1 | us-east-1 | [ami-0a788795af2d924bd](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a788795af2d924bd) |
| 3.9.1 | us-east-2 | [ami-09056926c45de21cd](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-09056926c45de21cd) |
| 3.9.1 | us-west-1 | [ami-0daf0dfadc0840523](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0daf0dfadc0840523) |
| 3.9.1 | us-west-2 | [ami-0829c32e97b009f6f](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0829c32e97b009f6f) |

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
