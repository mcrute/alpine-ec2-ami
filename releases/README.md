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

### Alpine Linux 3.11.3 (2020-02-05)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.11.3-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0a21fceb3a679c6a0](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a21fceb3a679c6a0) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a21fceb3a679c6a0)) |
| ap-northeast-2 | [ami-0446572a036203a7f](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0446572a036203a7f) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0446572a036203a7f)) |
| ap-south-1 | [ami-01597af5b044c6534](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01597af5b044c6534) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01597af5b044c6534)) |
| ap-southeast-1 | [ami-06add570453657288](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06add570453657288) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06add570453657288)) |
| ap-southeast-2 | [ami-014d6b6e0544303db](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-014d6b6e0544303db) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-014d6b6e0544303db)) |
| ca-central-1 | [ami-064cc1f1e4a3d17e7](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-064cc1f1e4a3d17e7) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-064cc1f1e4a3d17e7)) |
| eu-central-1 | [ami-06190102f27180777](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06190102f27180777) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06190102f27180777)) |
| eu-north-1 | [ami-025350371c14bbcf9](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-025350371c14bbcf9) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-025350371c14bbcf9)) |
| eu-west-1 | [ami-0719f170fa096b7c6](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0719f170fa096b7c6) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0719f170fa096b7c6)) |
| eu-west-2 | [ami-0fe16a039c49375e1](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fe16a039c49375e1) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fe16a039c49375e1)) |
| eu-west-3 | [ami-0a3aecc0fe5a748e0](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a3aecc0fe5a748e0) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0a3aecc0fe5a748e0)) |
| sa-east-1 | [ami-0f28a75976a21bca7](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f28a75976a21bca7) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f28a75976a21bca7)) |
| us-east-1 | [ami-0bd10e597480e8fdc](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bd10e597480e8fdc) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0bd10e597480e8fdc)) |
| us-east-2 | [ami-0741188fc6d365c12](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0741188fc6d365c12) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0741188fc6d365c12)) |
| us-west-1 | [ami-065633a2b189f7550](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-065633a2b189f7550) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-065633a2b189f7550)) |
| us-west-2 | [ami-050dd0423825ae4cd](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-050dd0423825ae4cd) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-050dd0423825ae4cd)) |

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

### Alpine Linux Edge (2020-02-05)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20200205024005 |
| ------ | --- |
| ap-northeast-1 | [ami-0e66e152e67bd01c4](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e66e152e67bd01c4) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e66e152e67bd01c4)) |
| ap-northeast-2 | [ami-0da81d92789ac64c9](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0da81d92789ac64c9) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0da81d92789ac64c9)) |
| ap-south-1 | [ami-00563d27b2511771e](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00563d27b2511771e) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00563d27b2511771e)) |
| ap-southeast-1 | [ami-0c319f4e0be04ba59](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c319f4e0be04ba59) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c319f4e0be04ba59)) |
| ap-southeast-2 | [ami-0a3ef06def6f50c0d](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a3ef06def6f50c0d) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0a3ef06def6f50c0d)) |
| ca-central-1 | [ami-09f98f0464adfebb2](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09f98f0464adfebb2) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09f98f0464adfebb2)) |
| eu-central-1 | [ami-001559f80be1add88](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-001559f80be1add88) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-001559f80be1add88)) |
| eu-north-1 | [ami-0440a037c49287602](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0440a037c49287602) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0440a037c49287602)) |
| eu-west-1 | [ami-0c6e2f66869524c92](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c6e2f66869524c92) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c6e2f66869524c92)) |
| eu-west-2 | [ami-0c89e502a2bbae39c](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c89e502a2bbae39c) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0c89e502a2bbae39c)) |
| eu-west-3 | [ami-0a96a077e024cf68c](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a96a077e024cf68c) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0a96a077e024cf68c)) |
| sa-east-1 | [ami-0701231683e53500b](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0701231683e53500b) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0701231683e53500b)) |
| us-east-1 | [ami-002a48030440e00da](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-002a48030440e00da) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-002a48030440e00da)) |
| us-east-2 | [ami-0ae27524e2b9bb820](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ae27524e2b9bb820) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ae27524e2b9bb820)) |
| us-west-1 | [ami-02a94605eedcd1d51](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02a94605eedcd1d51) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02a94605eedcd1d51)) |
| us-west-2 | [ami-034def9257bc1fa27](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-034def9257bc1fa27) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-034def9257bc1fa27)) |

</p></details>
