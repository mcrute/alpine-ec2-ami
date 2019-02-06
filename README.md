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
| 3.9.0 | ap-northeast-1 | [ami-025126171658214aa](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-025126171658214aa) |
| 3.9.0 | ap-northeast-2 | [ami-05094dd0e72c458fb](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-05094dd0e72c458fb) |
| 3.9.0 | ap-south-1 | [ami-07cb8c31eabcd3b4e](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07cb8c31eabcd3b4e) |
| 3.9.0 | ap-southeast-1 | [ami-0928dec71013505b0](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0928dec71013505b0) |
| 3.9.0 | ap-southeast-2 | [ami-0a5abea120f732aea](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0a5abea120f732aea) |
| 3.9.0 | ca-central-1 | [ami-08548db765868091d](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08548db765868091d) |
| 3.9.0 | eu-central-1 | [ami-0a42df7e65590651e](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a42df7e65590651e) |
| 3.9.0 | eu-north-1 | [ami-08b5a6088d1592e5b](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08b5a6088d1592e5b) |
| 3.9.0 | eu-west-1 | [ami-07bf2c996b3bec293](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07bf2c996b3bec293) |
| 3.9.0 | eu-west-2 | [ami-07642a3118c43a4e6](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07642a3118c43a4e6) |
| 3.9.0 | eu-west-3 | [ami-0916d5db3c81d60ce](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0916d5db3c81d60ce) |
| 3.9.0 | sa-east-1 | [ami-0a96fe9195efbba2b](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a96fe9195efbba2b) |
| 3.9.0 | us-east-1 | [ami-00e433019a9c7aa76](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00e433019a9c7aa76) |
| 3.9.0 | us-east-2 | [ami-029e1787b7a57b032](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-029e1787b7a57b032) |
| 3.9.0 | us-west-1 | [ami-0091bd0c0b9ad4b6b](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0091bd0c0b9ad4b6b) |
| 3.9.0 | us-west-2 | [ami-0fa1d403af627f066](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fa1d403af627f066) |

## Caveats

This image is being used in production but it's still somewhat early stage in
its development and thus there are some sharp edges.

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
