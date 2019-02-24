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
| 3.9.0-1 | ap-northeast-1 | [ami-0eaff92f5f149a429](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0eaff92f5f149a429) |
| 3.9.0-1 | ap-northeast-2 | [ami-0def256d4730ba94a](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0def256d4730ba94a) |
| 3.9.0-1 | ap-south-1 | [ami-026f34bef63412f33](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-026f34bef63412f33) |
| 3.9.0-1 | ap-southeast-1 | [ami-04a2ad17b9b13d4ec](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04a2ad17b9b13d4ec) |
| 3.9.0-1 | ap-southeast-2 | [ami-03c7885750c554d30](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-03c7885750c554d30) |
| 3.9.0-1 | ca-central-1 | [ami-0ef17552c0ecbfc4e](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ef17552c0ecbfc4e) |
| 3.9.0-1 | eu-central-1 | [ami-036c913a519569a6d](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-036c913a519569a6d) |
| 3.9.0-1 | eu-north-1 | [ami-0e86b5fc1e6414006](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e86b5fc1e6414006) |
| 3.9.0-1 | eu-west-1 | [ami-069efddebf851614d](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-069efddebf851614d) |
| 3.9.0-1 | eu-west-2 | [ami-0aa8ab64c1c6a2a3a](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0aa8ab64c1c6a2a3a) |
| 3.9.0-1 | eu-west-3 | [ami-00d39f7e016c2dd2b](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-00d39f7e016c2dd2b) |
| 3.9.0-1 | sa-east-1 | [ami-028a5b577032629ee](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-028a5b577032629ee) |
| 3.9.0-1 | us-east-1 | [ami-0b62ea2089812c46b](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b62ea2089812c46b) |
| 3.9.0-1 | us-east-2 | [ami-083b8d0f14c76dfd7](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-083b8d0f14c76dfd7) |
| 3.9.0-1 | us-west-1 | [ami-0dd01136582d41914](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dd01136582d41914) |
| 3.9.0-1 | us-west-2 | [ami-0efc4434c74bde9fe](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0efc4434c74bde9fe) |

## Caveats

This image is being used in production but it's still somewhat early stage in
its development and thus there are some sharp edges.

- As of 3.9.0-1, this AMI starts `haveged` at the boot runlevel, to provide
  additional initial entropy as discussed in issue #39.  In the long term, we
  expect the official Alpine Linux kernel configs will be updated to resolve
  the situation.

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
