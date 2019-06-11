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

### Alpine Linux 3.9.4 (2019-06-11)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.4-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0bb4073495ff2021e](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bb4073495ff2021e) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0bb4073495ff2021e)) |
| ap-northeast-2 | [ami-028d3d1675161319e](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-028d3d1675161319e) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-028d3d1675161319e)) |
| ap-south-1 | [ami-0f94a69d1ff0a7860](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f94a69d1ff0a7860) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f94a69d1ff0a7860)) |
| ap-southeast-1 | [ami-0f1c039e595dd2d02](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f1c039e595dd2d02) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f1c039e595dd2d02)) |
| ap-southeast-2 | [ami-0ca5b7ca3caa92758](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ca5b7ca3caa92758) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ca5b7ca3caa92758)) |
| ca-central-1 | [ami-05a3c167410bf6b35](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05a3c167410bf6b35) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-05a3c167410bf6b35)) |
| eu-central-1 | [ami-02df82b83ad2cdaec](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02df82b83ad2cdaec) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02df82b83ad2cdaec)) |
| eu-north-1 | [ami-0f7b7e2bef1209f6c](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f7b7e2bef1209f6c) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f7b7e2bef1209f6c)) |
| eu-west-1 | [ami-09234e83a8015efa4](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09234e83a8015efa4) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09234e83a8015efa4)) |
| eu-west-2 | [ami-091a16ac6bd29bdd3](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-091a16ac6bd29bdd3) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-091a16ac6bd29bdd3)) |
| eu-west-3 | [ami-084cb673481c3f793](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-084cb673481c3f793) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-084cb673481c3f793)) |
| sa-east-1 | [ami-014d631c23ebf306a](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-014d631c23ebf306a) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-014d631c23ebf306a)) |
| us-east-1 | [ami-04a29b11e34acf54d](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04a29b11e34acf54d) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04a29b11e34acf54d)) |
| us-east-2 | [ami-0d9445885a19e00ca](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d9445885a19e00ca) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d9445885a19e00ca)) |
| us-west-1 | [ami-0bef2dc6d3f4e19a2](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bef2dc6d3f4e19a2) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0bef2dc6d3f4e19a2)) |
| us-west-2 | [ami-0af07dadd734834a7](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0af07dadd734834a7) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0af07dadd734834a7)) |

</p></details>

### Alpine Linux Edge (2019-06-11)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20190611031724 |
| ------ | --- |
| ap-northeast-1 | [ami-0c97e7cdda534346b](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c97e7cdda534346b) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c97e7cdda534346b)) |
| ap-northeast-2 | [ami-00cceaf8288ee7386](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00cceaf8288ee7386) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-00cceaf8288ee7386)) |
| ap-south-1 | [ami-09e1d1ef7cd517a64](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09e1d1ef7cd517a64) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09e1d1ef7cd517a64)) |
| ap-southeast-1 | [ami-037323416789f3ce1](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-037323416789f3ce1) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-037323416789f3ce1)) |
| ap-southeast-2 | [ami-0d182653643257211](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d182653643257211) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d182653643257211)) |
| ca-central-1 | [ami-008c0bd239c168b34](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-008c0bd239c168b34) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-008c0bd239c168b34)) |
| eu-central-1 | [ami-0d808164dace58b4e](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d808164dace58b4e) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d808164dace58b4e)) |
| eu-north-1 | [ami-0c3152b1fd3b21ae9](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c3152b1fd3b21ae9) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c3152b1fd3b21ae9)) |
| eu-west-1 | [ami-031b9d6c98019452b](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-031b9d6c98019452b) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-031b9d6c98019452b)) |
| eu-west-2 | [ami-029d4646a3ea4fc0f](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-029d4646a3ea4fc0f) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-029d4646a3ea4fc0f)) |
| eu-west-3 | [ami-0d1e6f66f5a7fc568](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d1e6f66f5a7fc568) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0d1e6f66f5a7fc568)) |
| sa-east-1 | [ami-0b00f41d3df265296](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b00f41d3df265296) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b00f41d3df265296)) |
| us-east-1 | [ami-014a8bfc05b292686](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-014a8bfc05b292686) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-014a8bfc05b292686)) |
| us-east-2 | [ami-0d99a25549626e548](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d99a25549626e548) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d99a25549626e548)) |
| us-west-1 | [ami-03f03158096a615cd](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03f03158096a615cd) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03f03158096a615cd)) |
| us-west-2 | [ami-09a619850cd514295](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09a619850cd514295) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-09a619850cd514295)) |

</p></details>
