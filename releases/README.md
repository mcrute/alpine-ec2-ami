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

### Alpine Linux 3.11.2 (2020-01-04)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.11.2-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-0231a40676931971a](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0231a40676931971a) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0231a40676931971a)) |
| ap-northeast-2 | [ami-066b4452a247d5533](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-066b4452a247d5533) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-066b4452a247d5533)) |
| ap-south-1 | [ami-0b0f33d8cfb9e5051](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b0f33d8cfb9e5051) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b0f33d8cfb9e5051)) |
| ap-southeast-1 | [ami-0949989f302945c5a](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0949989f302945c5a) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0949989f302945c5a)) |
| ap-southeast-2 | [ami-08fb0d3aaf8945d02](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08fb0d3aaf8945d02) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-08fb0d3aaf8945d02)) |
| ca-central-1 | [ami-0e26eeafdc083c6e9](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e26eeafdc083c6e9) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e26eeafdc083c6e9)) |
| eu-central-1 | [ami-02fa942a71aadf188](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02fa942a71aadf188) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02fa942a71aadf188)) |
| eu-north-1 | [ami-03ce6e520f43392b9](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03ce6e520f43392b9) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03ce6e520f43392b9)) |
| eu-west-1 | [ami-07becf48e2f4057c8](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07becf48e2f4057c8) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-07becf48e2f4057c8)) |
| eu-west-2 | [ami-02ac6b3300d9070b1](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02ac6b3300d9070b1) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-02ac6b3300d9070b1)) |
| eu-west-3 | [ami-0b0726c29a8feff8a](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b0726c29a8feff8a) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0b0726c29a8feff8a)) |
| sa-east-1 | [ami-029a4c0dd953fdc64](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-029a4c0dd953fdc64) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-029a4c0dd953fdc64)) |
| us-east-1 | [ami-06dcf76ec7ffac7cb](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06dcf76ec7ffac7cb) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06dcf76ec7ffac7cb)) |
| us-east-2 | [ami-018b2823c3aa8b78e](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-018b2823c3aa8b78e) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-018b2823c3aa8b78e)) |
| us-west-1 | [ami-04de5ae2ed495f580](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04de5ae2ed495f580) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04de5ae2ed495f580)) |
| us-west-2 | [ami-0282e49ac0502691d](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0282e49ac0502691d) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0282e49ac0502691d)) |

</p></details>

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

### Alpine Linux Edge (2020-01-04)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20200104190012 |
| ------ | --- |
| ap-northeast-1 | [ami-0fda74ed5ffb7ccd7](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fda74ed5ffb7ccd7) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0fda74ed5ffb7ccd7)) |
| ap-northeast-2 | [ami-0be5d677b47fce454](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0be5d677b47fce454) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0be5d677b47fce454)) |
| ap-south-1 | [ami-094720b652f133f9c](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-094720b652f133f9c) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-094720b652f133f9c)) |
| ap-southeast-1 | [ami-0f7d8a18e9be21cd1](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f7d8a18e9be21cd1) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f7d8a18e9be21cd1)) |
| ap-southeast-2 | [ami-0386d4dc2cf9f3d91](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0386d4dc2cf9f3d91) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0386d4dc2cf9f3d91)) |
| ca-central-1 | [ami-0fe2907efc576aa3c](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fe2907efc576aa3c) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0fe2907efc576aa3c)) |
| eu-central-1 | [ami-08caf54970e53151e](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08caf54970e53151e) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08caf54970e53151e)) |
| eu-north-1 | [ami-063212df61bebdfac](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-063212df61bebdfac) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-063212df61bebdfac)) |
| eu-west-1 | [ami-034638ad783384202](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-034638ad783384202) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-034638ad783384202)) |
| eu-west-2 | [ami-041fba8b0ded32106](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-041fba8b0ded32106) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-041fba8b0ded32106)) |
| eu-west-3 | [ami-015e5b9edb52ee495](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-015e5b9edb52ee495) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-015e5b9edb52ee495)) |
| sa-east-1 | [ami-0dbd80d9204b2a206](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dbd80d9204b2a206) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dbd80d9204b2a206)) |
| us-east-1 | [ami-0047bb64e977f5521](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0047bb64e977f5521) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0047bb64e977f5521)) |
| us-east-2 | [ami-024246dd06d739e37](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-024246dd06d739e37) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-024246dd06d739e37)) |
| us-west-1 | [ami-089f878b5816e24f4](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-089f878b5816e24f4) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-089f878b5816e24f4)) |
| us-west-2 | [ami-0f6dc9ba311992682](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f6dc9ba311992682) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f6dc9ba311992682)) |

</p></details>
