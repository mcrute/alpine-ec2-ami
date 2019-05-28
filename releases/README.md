# Alpine Linux EC2 AMIs

**These are not official AWS or Alpine images.  They are community built and
supported.**

These AMIs should work with most EC2 features such as Elastic Network Adapters
and NVMe EBS volumes.  If you find any problems launching them on current
generation instances, please open an [issue](https://github.com/mcrute/alpine-ec2-ami/issues)
and include as much detailed information as possible.

During the *first boot* of instances created with these AMIs, the lightweight
[tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap) init
script...
- sets the instance's hostname,
- installs the SSH authorized_keys for the 'alpine' user,
- disables 'root' and 'alpine' users' passwords,
- expands the root partition to use all available EBS volume space,
- and executes a "user data" script (must be a shell script that starts with `#!`)

If you launch these AMIs to build other images (via [Packer](https://packer.io),
etc.), don't forget to remove `/var/lib/cloud/.bootstrap-complete` --
otherwise, instances launched from those second-generation AMIs will not run
`tiny-ec2-bootstrap` on their first boot.

The more popular [cloud-init](https://cloudinit.readthedocs.io/en/latest/)
is currently not supported on Alpine Linux.  If `cloud-init` support is
important to you, please open an [issue](https://github.com/mcrute/alpine-ec2-ami/issues).

## AMIs

### Alpine Linux 3.9.4 (2019-05-28)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.4-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0251fa7f8f8ed0a3b](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0251fa7f8f8ed0a3b) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0251fa7f8f8ed0a3b)) |
| ap-northeast-2 | [ami-0bb32f18ed247323e](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bb32f18ed247323e) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0bb32f18ed247323e)) |
| ap-south-1 | [ami-0ca42c8d33ec3ef66](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ca42c8d33ec3ef66) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ca42c8d33ec3ef66)) |
| ap-southeast-1 | [ami-032330b6de2f39f75](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-032330b6de2f39f75) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-032330b6de2f39f75)) |
| ap-southeast-2 | [ami-0681743c5235cb677](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0681743c5235cb677) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0681743c5235cb677)) |
| ca-central-1 | [ami-0dfcf967a696ee901](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dfcf967a696ee901) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dfcf967a696ee901)) |
| eu-central-1 | [ami-07a8060b90f208cf2](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07a8060b90f208cf2) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07a8060b90f208cf2)) |
| eu-north-1 | [ami-0f25dd1f2ab208b34](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f25dd1f2ab208b34) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f25dd1f2ab208b34)) |
| eu-west-1 | [ami-07453094c6d42a07e](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07453094c6d42a07e) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07453094c6d42a07e)) |
| eu-west-2 | [ami-03fa8e7cff9293332](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03fa8e7cff9293332) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-03fa8e7cff9293332)) |
| eu-west-3 | [ami-07aad42fdc4a7e79b](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07aad42fdc4a7e79b) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-07aad42fdc4a7e79b)) |
| sa-east-1 | [ami-04cac088d12e5ebf0](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04cac088d12e5ebf0) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04cac088d12e5ebf0)) |
| us-east-1 | [ami-0c2c618b193741157](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c2c618b193741157) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c2c618b193741157)) |
| us-east-2 | [ami-012e1a22371695544](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-012e1a22371695544) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-012e1a22371695544)) |
| us-west-1 | [ami-00f0f067a7d90b7e4](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00f0f067a7d90b7e4) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00f0f067a7d90b7e4)) |
| us-west-2 | [ami-0ed0fed8f127914fb](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ed0fed8f127914fb) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ed0fed8f127914fb)) |

</p></details>

### Alpine Linux Edge (2019-05-28)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20190528032210 |
| ------ | --- |
| ap-northeast-1 | [ami-03a19ed410069a4d8](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03a19ed410069a4d8) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03a19ed410069a4d8)) |
| ap-northeast-2 | [ami-05988a6c4660792ce](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05988a6c4660792ce) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-05988a6c4660792ce)) |
| ap-south-1 | [ami-08aaeba360cdab5a4](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08aaeba360cdab5a4) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08aaeba360cdab5a4)) |
| ap-southeast-1 | [ami-01ae6c2b20966a358](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01ae6c2b20966a358) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01ae6c2b20966a358)) |
| ap-southeast-2 | [ami-00193ff2f592dc22c](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00193ff2f592dc22c) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-00193ff2f592dc22c)) |
| ca-central-1 | [ami-086b7f5aa4cf0194e](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-086b7f5aa4cf0194e) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-086b7f5aa4cf0194e)) |
| eu-central-1 | [ami-089db5b316937779b](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-089db5b316937779b) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-089db5b316937779b)) |
| eu-north-1 | [ami-02ed2f6e56115d6f2](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02ed2f6e56115d6f2) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02ed2f6e56115d6f2)) |
| eu-west-1 | [ami-0afa00bfa1c870509](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0afa00bfa1c870509) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0afa00bfa1c870509)) |
| eu-west-2 | [ami-0b1e309dfd74525f2](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b1e309dfd74525f2) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b1e309dfd74525f2)) |
| eu-west-3 | [ami-0404d34bb3376e370](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0404d34bb3376e370) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0404d34bb3376e370)) |
| sa-east-1 | [ami-053be80e8c7b1ad62](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-053be80e8c7b1ad62) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-053be80e8c7b1ad62)) |
| us-east-1 | [ami-0d1ea89d2b00334f5](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d1ea89d2b00334f5) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d1ea89d2b00334f5)) |
| us-east-2 | [ami-0939714c9fe9ec10e](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0939714c9fe9ec10e) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0939714c9fe9ec10e)) |
| us-west-1 | [ami-0b9c5086efa0f067b](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b9c5086efa0f067b) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b9c5086efa0f067b)) |
| us-west-2 | [ami-0719ffe4d94e67432](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0719ffe4d94e67432) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0719ffe4d94e67432)) |

</p></details>
