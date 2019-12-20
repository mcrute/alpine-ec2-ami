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

### Alpine Linux 3.11.0 (2019-12-20)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.11.0-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-01dd2c66370a9c622](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01dd2c66370a9c622) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01dd2c66370a9c622)) |
| ap-northeast-2 | [ami-06b08ab572a319365](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06b08ab572a319365) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-06b08ab572a319365)) |
| ap-south-1 | [ami-0dba9ec182268ab0a](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0dba9ec182268ab0a) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0dba9ec182268ab0a)) |
| ap-southeast-1 | [ami-0c210488756706fe7](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c210488756706fe7) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c210488756706fe7)) |
| ap-southeast-2 | [ami-05e1972740cba6e7b](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05e1972740cba6e7b) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-05e1972740cba6e7b)) |
| ca-central-1 | [ami-02bb57a6922018826](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02bb57a6922018826) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02bb57a6922018826)) |
| eu-central-1 | [ami-09a7075582e44cc4a](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09a7075582e44cc4a) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09a7075582e44cc4a)) |
| eu-north-1 | [ami-01dc7a794c0c8062b](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01dc7a794c0c8062b) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-01dc7a794c0c8062b)) |
| eu-west-1 | [ami-0d219c533643cb00f](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d219c533643cb00f) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d219c533643cb00f)) |
| eu-west-2 | [ami-04426be48498be7af](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04426be48498be7af) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-04426be48498be7af)) |
| eu-west-3 | [ami-00d99d7627002d662](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00d99d7627002d662) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-00d99d7627002d662)) |
| sa-east-1 | [ami-05de427871abe1c40](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-05de427871abe1c40) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-05de427871abe1c40)) |
| us-east-1 | [ami-00ee2daec698aab7c](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00ee2daec698aab7c) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00ee2daec698aab7c)) |
| us-east-2 | [ami-01d8b7e276ad609aa](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01d8b7e276ad609aa) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-01d8b7e276ad609aa)) |
| us-west-1 | [ami-08d909997839b6030](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08d909997839b6030) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08d909997839b6030)) |
| us-west-2 | [ami-07a62f65352c51750](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07a62f65352c51750) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07a62f65352c51750)) |

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

### Alpine Linux Edge (2019-12-20)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20191220032351 |
| ------ | --- |
| ap-northeast-1 | [ami-09c848c4cb4b2bfcc](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09c848c4cb4b2bfcc) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09c848c4cb4b2bfcc)) |
| ap-northeast-2 | [ami-0ce75b84103d6cf1b](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ce75b84103d6cf1b) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0ce75b84103d6cf1b)) |
| ap-south-1 | [ami-024a83d2f5f690e9c](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-024a83d2f5f690e9c) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-024a83d2f5f690e9c)) |
| ap-southeast-1 | [ami-045d3298bde43a38e](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-045d3298bde43a38e) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-045d3298bde43a38e)) |
| ap-southeast-2 | [ami-02a507af131b58f77](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02a507af131b58f77) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-02a507af131b58f77)) |
| ca-central-1 | [ami-00f6c418339093258](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00f6c418339093258) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00f6c418339093258)) |
| eu-central-1 | [ami-00e094f733fa389c1](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00e094f733fa389c1) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00e094f733fa389c1)) |
| eu-north-1 | [ami-069b1f7572e57e869](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-069b1f7572e57e869) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-069b1f7572e57e869)) |
| eu-west-1 | [ami-0fe261f4ce1adac48](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fe261f4ce1adac48) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0fe261f4ce1adac48)) |
| eu-west-2 | [ami-0c8643b000cb720b6](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c8643b000cb720b6) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0c8643b000cb720b6)) |
| eu-west-3 | [ami-0bfe5b9d1a2d3c6c9](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0bfe5b9d1a2d3c6c9) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0bfe5b9d1a2d3c6c9)) |
| sa-east-1 | [ami-075e2722dd4b1e660](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-075e2722dd4b1e660) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-075e2722dd4b1e660)) |
| us-east-1 | [ami-0d42d7ed27a1b508a](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0d42d7ed27a1b508a) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0d42d7ed27a1b508a)) |
| us-east-2 | [ami-016775e32e6c85c18](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-016775e32e6c85c18) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-016775e32e6c85c18)) |
| us-west-1 | [ami-065cbd73f2f0dd6d6](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-065cbd73f2f0dd6d6) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-065cbd73f2f0dd6d6)) |
| us-west-2 | [ami-0897367ecebfd4b79](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0897367ecebfd4b79) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0897367ecebfd4b79)) |

</p></details>
