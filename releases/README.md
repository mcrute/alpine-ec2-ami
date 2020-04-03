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

### Alpine Linux 3.11.5 (2020-04-03)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.11.5-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-02945e11777c5d74a](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02945e11777c5d74a) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02945e11777c5d74a)) |
| ap-northeast-2 | [ami-071e19bba641e10c1](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-071e19bba641e10c1) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-071e19bba641e10c1)) |
| ap-south-1 | [ami-0df79a6a767372395](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0df79a6a767372395) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0df79a6a767372395)) |
| ap-southeast-1 | [ami-092bdb41e6d9f7060](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-092bdb41e6d9f7060) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-092bdb41e6d9f7060)) |
| ap-southeast-2 | [ami-02a1c7112bbe60f00](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02a1c7112bbe60f00) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-02a1c7112bbe60f00)) |
| ca-central-1 | [ami-0081665c09326cae2](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0081665c09326cae2) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0081665c09326cae2)) |
| eu-central-1 | [ami-09d753422dab3888f](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09d753422dab3888f) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09d753422dab3888f)) |
| eu-north-1 | [ami-0f326f36494b66d68](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f326f36494b66d68) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f326f36494b66d68)) |
| eu-west-1 | [ami-0c1e8337e5112eb80](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c1e8337e5112eb80) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c1e8337e5112eb80)) |
| eu-west-2 | [ami-06ec140a6fa5ff24c](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06ec140a6fa5ff24c) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-06ec140a6fa5ff24c)) |
| eu-west-3 | [ami-05270703db64782c3](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05270703db64782c3) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-05270703db64782c3)) |
| sa-east-1 | [ami-08e5a4dc318e84618](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08e5a4dc318e84618) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08e5a4dc318e84618)) |
| us-east-1 | [ami-02fa6ea44ed68cbd1](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02fa6ea44ed68cbd1) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02fa6ea44ed68cbd1)) |
| us-east-2 | [ami-0325fc21b50ee19ba](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0325fc21b50ee19ba) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0325fc21b50ee19ba)) |
| us-west-1 | [ami-003d6e7746c7e938e](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-003d6e7746c7e938e) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-003d6e7746c7e938e)) |
| us-west-2 | [ami-0966c757f79c1a553](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0966c757f79c1a553) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0966c757f79c1a553)) |

</p></details>

### Alpine Linux 3.10.4 (2020-02-05)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.4-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0dc770d65f50e9339](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dc770d65f50e9339) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dc770d65f50e9339)) |
| ap-northeast-2 | [ami-03a2be707d4d83cea](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03a2be707d4d83cea) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-03a2be707d4d83cea)) |
| ap-south-1 | [ami-00fac10f41dff96e4](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00fac10f41dff96e4) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00fac10f41dff96e4)) |
| ap-southeast-1 | [ami-0aadcaa1f71c42546](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0aadcaa1f71c42546) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0aadcaa1f71c42546)) |
| ap-southeast-2 | [ami-0ba48065660ab830f](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ba48065660ab830f) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ba48065660ab830f)) |
| ca-central-1 | [ami-0a54918dadce6828a](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a54918dadce6828a) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a54918dadce6828a)) |
| eu-central-1 | [ami-01de425983c4c1bfc](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01de425983c4c1bfc) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01de425983c4c1bfc)) |
| eu-north-1 | [ami-0011e13dbacb8fcb4](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0011e13dbacb8fcb4) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0011e13dbacb8fcb4)) |
| eu-west-1 | [ami-0d645d9aa9af199e7](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d645d9aa9af199e7) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d645d9aa9af199e7)) |
| eu-west-2 | [ami-047029018b46688b5](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-047029018b46688b5) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-047029018b46688b5)) |
| eu-west-3 | [ami-070b405f25870cfa4](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-070b405f25870cfa4) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-070b405f25870cfa4)) |
| sa-east-1 | [ami-01af983d84e7075aa](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01af983d84e7075aa) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01af983d84e7075aa)) |
| us-east-1 | [ami-014e31a6d6da30eb7](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-014e31a6d6da30eb7) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-014e31a6d6da30eb7)) |
| us-east-2 | [ami-004421f607bf25444](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-004421f607bf25444) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-004421f607bf25444)) |
| us-west-1 | [ami-0e07b975efa6cba65](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e07b975efa6cba65) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e07b975efa6cba65)) |
| us-west-2 | [ami-07128e75c4dcc9c7c](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07128e75c4dcc9c7c) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07128e75c4dcc9c7c)) |

</p></details>

### Alpine Linux 3.9.5 (2020-02-05)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.5-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0f22ba5f542102103](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f22ba5f542102103) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f22ba5f542102103)) |
| ap-northeast-2 | [ami-042ed34c048fd4dde](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-042ed34c048fd4dde) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-042ed34c048fd4dde)) |
| ap-south-1 | [ami-03aa6dfb6b5c5b24d](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03aa6dfb6b5c5b24d) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03aa6dfb6b5c5b24d)) |
| ap-southeast-1 | [ami-09aa8a66b52872964](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09aa8a66b52872964) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09aa8a66b52872964)) |
| ap-southeast-2 | [ami-0883e80a814ca1ead](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0883e80a814ca1ead) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0883e80a814ca1ead)) |
| ca-central-1 | [ami-07ced81b329157965](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07ced81b329157965) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07ced81b329157965)) |
| eu-central-1 | [ami-0b1156425ee49460e](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b1156425ee49460e) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b1156425ee49460e)) |
| eu-north-1 | [ami-0dae27e872bbb58a3](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dae27e872bbb58a3) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dae27e872bbb58a3)) |
| eu-west-1 | [ami-032df31e3645eac89](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-032df31e3645eac89) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-032df31e3645eac89)) |
| eu-west-2 | [ami-0ca53eef190752d9b](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ca53eef190752d9b) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ca53eef190752d9b)) |
| eu-west-3 | [ami-01d92abfc31832091](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01d92abfc31832091) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-01d92abfc31832091)) |
| sa-east-1 | [ami-044b116c38c67bbe6](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-044b116c38c67bbe6) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-044b116c38c67bbe6)) |
| us-east-1 | [ami-01d51c30d2c611d0b](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01d51c30d2c611d0b) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01d51c30d2c611d0b)) |
| us-east-2 | [ami-023a120054be00f14](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-023a120054be00f14) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-023a120054be00f14)) |
| us-west-1 | [ami-0b628545bb655d1e3](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b628545bb655d1e3) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b628545bb655d1e3)) |
| us-west-2 | [ami-06dc8e37edaccd91d](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06dc8e37edaccd91d) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-06dc8e37edaccd91d)) |

</p></details>

### Alpine Linux Edge (2020-04-03)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20200403021415 |
| ------ | --- |
| ap-northeast-1 | [ami-0a930ab443e79658a](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a930ab443e79658a) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a930ab443e79658a)) |
| ap-northeast-2 | [ami-0e5c3704b08250be0](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e5c3704b08250be0) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0e5c3704b08250be0)) |
| ap-south-1 | [ami-0e9b4aa2c6dfa1c6b](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e9b4aa2c6dfa1c6b) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e9b4aa2c6dfa1c6b)) |
| ap-southeast-1 | [ami-017d1c8652fe5fb6e](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-017d1c8652fe5fb6e) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-017d1c8652fe5fb6e)) |
| ap-southeast-2 | [ami-0b20e853350fcc974](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b20e853350fcc974) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b20e853350fcc974)) |
| ca-central-1 | [ami-078a0413716fb1ee2](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-078a0413716fb1ee2) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-078a0413716fb1ee2)) |
| eu-central-1 | [ami-0b949041038ac64f8](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b949041038ac64f8) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b949041038ac64f8)) |
| eu-north-1 | [ami-046e324b95557b67e](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-046e324b95557b67e) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-046e324b95557b67e)) |
| eu-west-1 | [ami-0370efeca292a68fa](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0370efeca292a68fa) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0370efeca292a68fa)) |
| eu-west-2 | [ami-0581c02f513cab380](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0581c02f513cab380) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0581c02f513cab380)) |
| eu-west-3 | [ami-03b6049476dc86faa](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03b6049476dc86faa) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-03b6049476dc86faa)) |
| sa-east-1 | [ami-0a82e4262b07441f2](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a82e4262b07441f2) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a82e4262b07441f2)) |
| us-east-1 | [ami-034b4fb0ea71693e3](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-034b4fb0ea71693e3) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-034b4fb0ea71693e3)) |
| us-east-2 | [ami-058700b313ac9dde9](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-058700b313ac9dde9) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-058700b313ac9dde9)) |
| us-west-1 | [ami-08e25ab23aa5a3904](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08e25ab23aa5a3904) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08e25ab23aa5a3904)) |
| us-west-2 | [ami-08f7bd174f27a0375](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08f7bd174f27a0375) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-08f7bd174f27a0375)) |

</p></details>
