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

### Alpine Linux 3.10.2 (2019-08-26)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.2-x86_64-r1 |
| ------ | --- |
| ap-northeast-1 | [ami-0865b6aea9d3d4e9a](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0865b6aea9d3d4e9a) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0865b6aea9d3d4e9a)) |
| ap-northeast-2 | [ami-0eb3806a09c62e80a](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0eb3806a09c62e80a) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0eb3806a09c62e80a)) |
| ap-south-1 | [ami-03c079c4f6a77bcd8](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03c079c4f6a77bcd8) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03c079c4f6a77bcd8)) |
| ap-southeast-1 | [ami-03cbf9e5c42bd2de0](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03cbf9e5c42bd2de0) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03cbf9e5c42bd2de0)) |
| ap-southeast-2 | [ami-040ee9c325bd773bb](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-040ee9c325bd773bb) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-040ee9c325bd773bb)) |
| ca-central-1 | [ami-0aeee1c23a65f09e5](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0aeee1c23a65f09e5) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0aeee1c23a65f09e5)) |
| eu-central-1 | [ami-01c4a5f25d39d8c1d](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01c4a5f25d39d8c1d) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01c4a5f25d39d8c1d)) |
| eu-north-1 | [ami-0ac4f026a4624309e](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ac4f026a4624309e) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ac4f026a4624309e)) |
| eu-west-1 | [ami-073456a92b131bee5](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-073456a92b131bee5) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-073456a92b131bee5)) |
| eu-west-2 | [ami-04c585868e7f9016e](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04c585868e7f9016e) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-04c585868e7f9016e)) |
| eu-west-3 | [ami-0196d7c3d0c2e5230](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0196d7c3d0c2e5230) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0196d7c3d0c2e5230)) |
| sa-east-1 | [ami-0437041273be4d2b3](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0437041273be4d2b3) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0437041273be4d2b3)) |
| us-east-1 | [ami-0b13bd8ab9492449c](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b13bd8ab9492449c) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b13bd8ab9492449c)) |
| us-east-2 | [ami-0a87fa8a73b9b850c](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a87fa8a73b9b850c) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0a87fa8a73b9b850c)) |
| us-west-1 | [ami-009961e3d2d7ccaa8](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-009961e3d2d7ccaa8) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-009961e3d2d7ccaa8)) |
| us-west-2 | [ami-0a083cc95e2bbc4b0](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a083cc95e2bbc4b0) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0a083cc95e2bbc4b0)) |

</p></details>

### Alpine Linux 3.9.4 (2019-07-26)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.4-x86_64-r1 |
| ------ | --- |
| ap-northeast-1 | [ami-0d12649cf98b9c29b](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d12649cf98b9c29b) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d12649cf98b9c29b)) |
| ap-northeast-2 | [ami-004372232cf1a20ac](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-004372232cf1a20ac) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-004372232cf1a20ac)) |
| ap-south-1 | [ami-091de53a3582f2779](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-091de53a3582f2779) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-091de53a3582f2779)) |
| ap-southeast-1 | [ami-07f6f363322b884d5](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07f6f363322b884d5) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07f6f363322b884d5)) |
| ap-southeast-2 | [ami-0eeff0d7c1943665c](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0eeff0d7c1943665c) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0eeff0d7c1943665c)) |
| ca-central-1 | [ami-011ad5e9b2fcfa1d5](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-011ad5e9b2fcfa1d5) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-011ad5e9b2fcfa1d5)) |
| eu-central-1 | [ami-0d4f6bb2a4f857256](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d4f6bb2a4f857256) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d4f6bb2a4f857256)) |
| eu-north-1 | [ami-01c04b1d21717da2d](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01c04b1d21717da2d) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01c04b1d21717da2d)) |
| eu-west-1 | [ami-0c9ac6e4570bad5c1](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c9ac6e4570bad5c1) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c9ac6e4570bad5c1)) |
| eu-west-2 | [ami-0bc07c10c240525e4](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bc07c10c240525e4) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0bc07c10c240525e4)) |
| eu-west-3 | [ami-0ebda60768a596a7f](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ebda60768a596a7f) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0ebda60768a596a7f)) |
| sa-east-1 | [ami-0a2d4fb282401447a](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a2d4fb282401447a) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a2d4fb282401447a)) |
| us-east-1 | [ami-0a8b8edcf88c2e496](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a8b8edcf88c2e496) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a8b8edcf88c2e496)) |
| us-east-2 | [ami-030ce78952c4c097c](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-030ce78952c4c097c) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-030ce78952c4c097c)) |
| us-west-1 | [ami-0e27a7d83365f16be](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e27a7d83365f16be) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e27a7d83365f16be)) |
| us-west-2 | [ami-07f10e32e0621a4eb](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07f10e32e0621a4eb) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07f10e32e0621a4eb)) |

</p></details>

### Alpine Linux Edge (2019-08-26)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20190826015716 |
| ------ | --- |
| ap-northeast-1 | [ami-0aee477cc2cee23cf](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0aee477cc2cee23cf) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0aee477cc2cee23cf)) |
| ap-northeast-2 | [ami-05cbcb200dde2845b](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05cbcb200dde2845b) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-05cbcb200dde2845b)) |
| ap-south-1 | [ami-0c3747e69c2496209](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c3747e69c2496209) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c3747e69c2496209)) |
| ap-southeast-1 | [ami-02f37bdd135ec4d42](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02f37bdd135ec4d42) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02f37bdd135ec4d42)) |
| ap-southeast-2 | [ami-0463b6ff7b57d9090](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0463b6ff7b57d9090) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0463b6ff7b57d9090)) |
| ca-central-1 | [ami-0e4a890b424d67f67](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e4a890b424d67f67) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e4a890b424d67f67)) |
| eu-central-1 | [ami-092b4f46b7d79af32](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-092b4f46b7d79af32) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-092b4f46b7d79af32)) |
| eu-north-1 | [ami-042a6066f12f93411](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-042a6066f12f93411) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-042a6066f12f93411)) |
| eu-west-1 | [ami-04b8b162151a2e45d](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04b8b162151a2e45d) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04b8b162151a2e45d)) |
| eu-west-2 | [ami-0fa5a6db02d8cff64](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fa5a6db02d8cff64) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fa5a6db02d8cff64)) |
| eu-west-3 | [ami-07614b8be5de3b1a0](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07614b8be5de3b1a0) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-07614b8be5de3b1a0)) |
| sa-east-1 | [ami-09324c8018c018931](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09324c8018c018931) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09324c8018c018931)) |
| us-east-1 | [ami-08f2e440a4fc821b0](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08f2e440a4fc821b0) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08f2e440a4fc821b0)) |
| us-east-2 | [ami-002f49d922035cd6b](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-002f49d922035cd6b) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-002f49d922035cd6b)) |
| us-west-1 | [ami-0e146ed2f408cfaee](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e146ed2f408cfaee) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e146ed2f408cfaee)) |
| us-west-2 | [ami-052fcb0bc085a75a2](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-052fcb0bc085a75a2) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-052fcb0bc085a75a2)) |

</p></details>
