# Alpine Linux EC2 AMIs

**These are not official AWS or Alpine images.  They are community built and
supported.**

These AMIs should work with most EC2 features such as ENI's (Elastic Network
Interfaces) and NVMe EBS (Elastic Block Storage) volumes.  If you find any
problems launching them on current generation instances, please open an
[issue](https://github.com/mcrute/alpine-ec2-ami/issues) and include as much
detailed information as possible.

AMIs built after 2020-09-15 include support for hot-pluggable ENI's and will
sync all private IPv4 and IPv6 address on those ENI's on `udhcpc` post-bound and
post-renew events.

During the *first boot* of instances created with these AMIs, the lightweight
[tiny-ec2-bootstrap](https://github.com/mcrute/tiny-ec2-bootstrap) init
script...
- sets the instance's hostname,
- installs the SSH authorized_keys for the 'alpine' user,
- disables 'root' and AMI user (default 'alpine') passwords,
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

### Alpine Linux 3.11.6 (2020-04-25)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.11.6-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-04dd34605aba7ce11](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04dd34605aba7ce11) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04dd34605aba7ce11)) |
| ap-northeast-2 | [ami-0fd25bd139c05812d](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fd25bd139c05812d) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fd25bd139c05812d)) |
| ap-south-1 | [ami-08437e8244154999a](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08437e8244154999a) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08437e8244154999a)) |
| ap-southeast-1 | [ami-04a63840be47a0816](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04a63840be47a0816) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04a63840be47a0816)) |
| ap-southeast-2 | [ami-07be0b72172a63df3](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07be0b72172a63df3) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07be0b72172a63df3)) |
| ca-central-1 | [ami-013d1db5df4ad7d4a](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-013d1db5df4ad7d4a) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-013d1db5df4ad7d4a)) |
| eu-central-1 | [ami-03bc1e4d4bf636895](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03bc1e4d4bf636895) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03bc1e4d4bf636895)) |
| eu-north-1 | [ami-03830331da71d3b6a](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03830331da71d3b6a) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03830331da71d3b6a)) |
| eu-west-1 | [ami-0a3bf003cc0e5cbaf](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a3bf003cc0e5cbaf) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a3bf003cc0e5cbaf)) |
| eu-west-2 | [ami-0dcb13d7ab5820ac0](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dcb13d7ab5820ac0) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0dcb13d7ab5820ac0)) |
| eu-west-3 | [ami-043d77b850fc69cff](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-043d77b850fc69cff) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-043d77b850fc69cff)) |
| sa-east-1 | [ami-0056de88b2ebc5071](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0056de88b2ebc5071) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0056de88b2ebc5071)) |
| us-east-1 | [ami-0da684cce2ab4aadb](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0da684cce2ab4aadb) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0da684cce2ab4aadb)) |
| us-east-2 | [ami-014d15ba809c1e48f](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-014d15ba809c1e48f) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-014d15ba809c1e48f)) |
| us-west-1 | [ami-05f659e5fe3528bbd](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05f659e5fe3528bbd) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-05f659e5fe3528bbd)) |
| us-west-2 | [ami-0380e01590d421d3e](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0380e01590d421d3e) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0380e01590d421d3e)) |

</p></details>

### Alpine Linux 3.10.5 (2020-04-25)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.5-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-043d40c880c7a176b](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-043d40c880c7a176b) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-043d40c880c7a176b)) |
| ap-northeast-2 | [ami-0595dc50c0f0e23f7](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0595dc50c0f0e23f7) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0595dc50c0f0e23f7)) |
| ap-south-1 | [ami-0c8a22fa0ee90c07a](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c8a22fa0ee90c07a) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c8a22fa0ee90c07a)) |
| ap-southeast-1 | [ami-0244d1373053cfe5b](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0244d1373053cfe5b) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0244d1373053cfe5b)) |
| ap-southeast-2 | [ami-0cf284dc25e35862d](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0cf284dc25e35862d) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0cf284dc25e35862d)) |
| ca-central-1 | [ami-08c250f635a417222](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08c250f635a417222) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08c250f635a417222)) |
| eu-central-1 | [ami-0a626b78c94340b6e](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a626b78c94340b6e) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a626b78c94340b6e)) |
| eu-north-1 | [ami-041b6bdb27dbc8226](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-041b6bdb27dbc8226) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-041b6bdb27dbc8226)) |
| eu-west-1 | [ami-0451f26166639b1b9](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0451f26166639b1b9) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0451f26166639b1b9)) |
| eu-west-2 | [ami-08ca328d558bee247](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08ca328d558bee247) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-08ca328d558bee247)) |
| eu-west-3 | [ami-0bbb1a9d10ee0e6ee](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bbb1a9d10ee0e6ee) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0bbb1a9d10ee0e6ee)) |
| sa-east-1 | [ami-088bc83fe1497e710](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-088bc83fe1497e710) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-088bc83fe1497e710)) |
| us-east-1 | [ami-0e635ea3ca126c707](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e635ea3ca126c707) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e635ea3ca126c707)) |
| us-east-2 | [ami-0f5a09a7d1d0ae35f](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f5a09a7d1d0ae35f) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f5a09a7d1d0ae35f)) |
| us-west-1 | [ami-06c2aa86f3a72385e](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06c2aa86f3a72385e) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06c2aa86f3a72385e)) |
| us-west-2 | [ami-0b6f8a395fa8b5961](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b6f8a395fa8b5961) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b6f8a395fa8b5961)) |

</p></details>

### Alpine Linux 3.9.6 (2020-04-25)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.6-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0133f3a571f684178](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0133f3a571f684178) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0133f3a571f684178)) |
| ap-northeast-2 | [ami-0f9ad7c51e14bdc3d](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f9ad7c51e14bdc3d) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f9ad7c51e14bdc3d)) |
| ap-south-1 | [ami-00af726ec2f4077a2](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00af726ec2f4077a2) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00af726ec2f4077a2)) |
| ap-southeast-1 | [ami-0d52e9d7f91ca051c](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d52e9d7f91ca051c) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d52e9d7f91ca051c)) |
| ap-southeast-2 | [ami-054360648343b66bc](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-054360648343b66bc) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-054360648343b66bc)) |
| ca-central-1 | [ami-0583a99f342097b6c](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0583a99f342097b6c) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0583a99f342097b6c)) |
| eu-central-1 | [ami-051eec0106a08df6d](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-051eec0106a08df6d) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-051eec0106a08df6d)) |
| eu-north-1 | [ami-07a2b23059054aea3](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07a2b23059054aea3) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07a2b23059054aea3)) |
| eu-west-1 | [ami-0eb2b54ab4d09eb80](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0eb2b54ab4d09eb80) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0eb2b54ab4d09eb80)) |
| eu-west-2 | [ami-08c87b358b24d1df3](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08c87b358b24d1df3) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-08c87b358b24d1df3)) |
| eu-west-3 | [ami-00a425aa20737343e](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00a425aa20737343e) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-00a425aa20737343e)) |
| sa-east-1 | [ami-0ea679407da47b78a](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ea679407da47b78a) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ea679407da47b78a)) |
| us-east-1 | [ami-004f0550310a2d7aa](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-004f0550310a2d7aa) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-004f0550310a2d7aa)) |
| us-east-2 | [ami-045a2cc3fe272caee](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-045a2cc3fe272caee) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-045a2cc3fe272caee)) |
| us-west-1 | [ami-026a54e52daea1233](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-026a54e52daea1233) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-026a54e52daea1233)) |
| us-west-2 | [ami-0b933475d362cbfab](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b933475d362cbfab) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b933475d362cbfab)) |

</p></details>

### Alpine Linux Edge (2020-04-25)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20200425232123 |
| ------ | --- |
| ap-northeast-1 | [ami-0f64e8385eb16f0c5](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f64e8385eb16f0c5) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f64e8385eb16f0c5)) |
| ap-northeast-2 | [ami-0f6525d9186a0ee66](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f6525d9186a0ee66) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f6525d9186a0ee66)) |
| ap-south-1 | [ami-034d9a20d9bf2049f](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-034d9a20d9bf2049f) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-034d9a20d9bf2049f)) |
| ap-southeast-1 | [ami-0e64d169297389f9e](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e64d169297389f9e) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e64d169297389f9e)) |
| ap-southeast-2 | [ami-0afc0bab8196b70e4](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0afc0bab8196b70e4) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0afc0bab8196b70e4)) |
| ca-central-1 | [ami-068da53b91dcfad35](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-068da53b91dcfad35) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-068da53b91dcfad35)) |
| eu-central-1 | [ami-0b04139e51df7902b](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b04139e51df7902b) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b04139e51df7902b)) |
| eu-north-1 | [ami-0ac2cb76721262b8f](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ac2cb76721262b8f) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ac2cb76721262b8f)) |
| eu-west-1 | [ami-0a86b121e789d84a2](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a86b121e789d84a2) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a86b121e789d84a2)) |
| eu-west-2 | [ami-0329b37ebc36521c7](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0329b37ebc36521c7) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0329b37ebc36521c7)) |
| eu-west-3 | [ami-037d85dcf06bc913e](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-037d85dcf06bc913e) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-037d85dcf06bc913e)) |
| sa-east-1 | [ami-0b8e53df93ee4132d](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b8e53df93ee4132d) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b8e53df93ee4132d)) |
| us-east-1 | [ami-097be5ea1a5c7b6ce](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-097be5ea1a5c7b6ce) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-097be5ea1a5c7b6ce)) |
| us-east-2 | [ami-0f40de04e77f600b6](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f40de04e77f600b6) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f40de04e77f600b6)) |
| us-west-1 | [ami-095527a55aa7c1c1d](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-095527a55aa7c1c1d) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-095527a55aa7c1c1d)) |
| us-west-2 | [ami-0e5711189d37ddd64](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e5711189d37ddd64) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0e5711189d37ddd64)) |

</p></details>
