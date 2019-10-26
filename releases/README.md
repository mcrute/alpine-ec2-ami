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

### Alpine Linux 3.10.3 (2019-10-26)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.3-x86_64-r1 |
| ------ | --- |
| ap-northeast-1 | [ami-0760cd78e75cb77a4](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0760cd78e75cb77a4) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0760cd78e75cb77a4)) |
| ap-northeast-2 | [ami-0e749a03d064c1e47](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e749a03d064c1e47) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0e749a03d064c1e47)) |
| ap-south-1 | [ami-0a8839c12787f0c46](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a8839c12787f0c46) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a8839c12787f0c46)) |
| ap-southeast-1 | [ami-0f0e2be5d8c0110c1](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f0e2be5d8c0110c1) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f0e2be5d8c0110c1)) |
| ap-southeast-2 | [ami-0ca4caea0ce1f4a8a](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ca4caea0ce1f4a8a) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ca4caea0ce1f4a8a)) |
| ca-central-1 | [ami-016d172dee4ff4a22](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-016d172dee4ff4a22) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-016d172dee4ff4a22)) |
| eu-central-1 | [ami-04e50c8006d4bc2bf](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04e50c8006d4bc2bf) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04e50c8006d4bc2bf)) |
| eu-north-1 | [ami-00207f3df9a9cb088](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00207f3df9a9cb088) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00207f3df9a9cb088)) |
| eu-west-1 | [ami-01c1ec8fdefc61650](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01c1ec8fdefc61650) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01c1ec8fdefc61650)) |
| eu-west-2 | [ami-02520e7e046db5d8f](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02520e7e046db5d8f) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-02520e7e046db5d8f)) |
| eu-west-3 | [ami-0ef9a828aded0a0de](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ef9a828aded0a0de) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0ef9a828aded0a0de)) |
| sa-east-1 | [ami-0ee958f7773223770](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ee958f7773223770) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ee958f7773223770)) |
| us-east-1 | [ami-063cb098a86c1c4cc](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-063cb098a86c1c4cc) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-063cb098a86c1c4cc)) |
| us-east-2 | [ami-0110d80369eb75f49](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0110d80369eb75f49) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0110d80369eb75f49)) |
| us-west-1 | [ami-00b06ce695a617956](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00b06ce695a617956) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00b06ce695a617956)) |
| us-west-2 | [ami-0d0b7768c8cd9a8c8](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d0b7768c8cd9a8c8) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0d0b7768c8cd9a8c8)) |

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

### Alpine Linux Edge (2019-10-26)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20191026200352 |
| ------ | --- |
| ap-northeast-1 | [ami-0112f6ea81c86d5e6](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0112f6ea81c86d5e6) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0112f6ea81c86d5e6)) |
| ap-northeast-2 | [ami-085769ebaedbfdf81](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-085769ebaedbfdf81) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-085769ebaedbfdf81)) |
| ap-south-1 | [ami-018d0a72b1c1b2923](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-018d0a72b1c1b2923) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-018d0a72b1c1b2923)) |
| ap-southeast-1 | [ami-0efbcf7df7751898a](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0efbcf7df7751898a) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0efbcf7df7751898a)) |
| ap-southeast-2 | [ami-06dc954ca0af33023](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06dc954ca0af33023) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-06dc954ca0af33023)) |
| ca-central-1 | [ami-029fabbc15f6ec893](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-029fabbc15f6ec893) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-029fabbc15f6ec893)) |
| eu-central-1 | [ami-01353f3799d62f271](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01353f3799d62f271) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01353f3799d62f271)) |
| eu-north-1 | [ami-0787f149b1a3f8194](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0787f149b1a3f8194) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0787f149b1a3f8194)) |
| eu-west-1 | [ami-068378748044554e5](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-068378748044554e5) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-068378748044554e5)) |
| eu-west-2 | [ami-058faf9bf50c5fdc4](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-058faf9bf50c5fdc4) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-058faf9bf50c5fdc4)) |
| eu-west-3 | [ami-0f0bdda8a983eace3](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f0bdda8a983eace3) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0f0bdda8a983eace3)) |
| sa-east-1 | [ami-08b88bdd43ac5d063](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08b88bdd43ac5d063) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08b88bdd43ac5d063)) |
| us-east-1 | [ami-0193a17629e6377fc](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0193a17629e6377fc) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0193a17629e6377fc)) |
| us-east-2 | [ami-03db856d0b5b661ce](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03db856d0b5b661ce) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-03db856d0b5b661ce)) |
| us-west-1 | [ami-04864199556e66fad](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04864199556e66fad) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04864199556e66fad)) |
| us-west-2 | [ami-03e59f12dbbee65d4](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03e59f12dbbee65d4) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-03e59f12dbbee65d4)) |

</p></details>
