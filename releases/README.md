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

### Alpine Linux 3.10.0 (2019-06-20)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.0-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-00d72ba9e4e50e6f0](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-00d72ba9e4e50e6f0) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-00d72ba9e4e50e6f0)) |
| ap-northeast-2 | [ami-0b2ab59439d69c87f](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b2ab59439d69c87f) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b2ab59439d69c87f)) |
| ap-south-1 | [ami-06ab2e1b19df43403](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06ab2e1b19df43403) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06ab2e1b19df43403)) |
| ap-southeast-1 | [ami-097e487f602370726](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-097e487f602370726) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-097e487f602370726)) |
| ap-southeast-2 | [ami-0f2248216c030f2ea](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f2248216c030f2ea) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0f2248216c030f2ea)) |
| ca-central-1 | [ami-035f9ddc53b8e3c94](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-035f9ddc53b8e3c94) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-035f9ddc53b8e3c94)) |
| eu-central-1 | [ami-0c2583ed13862fb17](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c2583ed13862fb17) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c2583ed13862fb17)) |
| eu-north-1 | [ami-069c11c7844825375](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-069c11c7844825375) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-069c11c7844825375)) |
| eu-west-1 | [ami-076b4d480f72a117f](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-076b4d480f72a117f) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-076b4d480f72a117f)) |
| eu-west-2 | [ami-0a5d209eea58688c2](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a5d209eea58688c2) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0a5d209eea58688c2)) |
| eu-west-3 | [ami-0385dc3d759aaa464](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0385dc3d759aaa464) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-0385dc3d759aaa464)) |
| sa-east-1 | [ami-04ddd371cd342921d](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04ddd371cd342921d) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04ddd371cd342921d)) |
| us-east-1 | [ami-0647412cf72f247d9](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0647412cf72f247d9) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0647412cf72f247d9)) |
| us-east-2 | [ami-0fb394548acf15691](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fb394548acf15691) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fb394548acf15691)) |
| us-west-1 | [ami-04d80966c446c3f58](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04d80966c446c3f58) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04d80966c446c3f58)) |
| us-west-2 | [ami-0c71a8664131b42b3](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c71a8664131b42b3) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0c71a8664131b42b3)) |

</p></details>

### Alpine Linux 3.9.4 (2019-06-20)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.9.4-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-03d9fcbacd2999688](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03d9fcbacd2999688) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03d9fcbacd2999688)) |
| ap-northeast-2 | [ami-004989011ec957b83](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-004989011ec957b83) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-004989011ec957b83)) |
| ap-south-1 | [ami-0cb67b835ca871537](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0cb67b835ca871537) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0cb67b835ca871537)) |
| ap-southeast-1 | [ami-03f6391214dbfd225](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03f6391214dbfd225) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03f6391214dbfd225)) |
| ap-southeast-2 | [ami-0074f16503a9ebe8c](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0074f16503a9ebe8c) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0074f16503a9ebe8c)) |
| ca-central-1 | [ami-0a3cf4fc46141c449](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a3cf4fc46141c449) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a3cf4fc46141c449)) |
| eu-central-1 | [ami-007081891d730c5f1](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-007081891d730c5f1) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-007081891d730c5f1)) |
| eu-north-1 | [ami-09267b5c6d7722fdd](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09267b5c6d7722fdd) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-09267b5c6d7722fdd)) |
| eu-west-1 | [ami-0587fd7b04af5d01d](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0587fd7b04af5d01d) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0587fd7b04af5d01d)) |
| eu-west-2 | [ami-09b9943895590f23e](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-09b9943895590f23e) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-09b9943895590f23e)) |
| eu-west-3 | [ami-01dcaa2533a49748d](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01dcaa2533a49748d) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-01dcaa2533a49748d)) |
| sa-east-1 | [ami-0645cb90aca8de136](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0645cb90aca8de136) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0645cb90aca8de136)) |
| us-east-1 | [ami-0ac744c9e5e2dcbcf](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ac744c9e5e2dcbcf) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ac744c9e5e2dcbcf)) |
| us-east-2 | [ami-074a01fd0b7de0135](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-074a01fd0b7de0135) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-074a01fd0b7de0135)) |
| us-west-1 | [ami-0a70d6f1ce22ddfb1](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a70d6f1ce22ddfb1) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a70d6f1ce22ddfb1)) |
| us-west-2 | [ami-006aeb6d57c92f978](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-006aeb6d57c92f978) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-006aeb6d57c92f978)) |

</p></details>

### Alpine Linux Edge (2019-06-20)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20190620045615 |
| ------ | --- |
| ap-northeast-1 | [ami-0367295ac0c2084ca](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0367295ac0c2084ca) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0367295ac0c2084ca)) |
| ap-northeast-2 | [ami-07a4067a66f4e23b6](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07a4067a66f4e23b6) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07a4067a66f4e23b6)) |
| ap-south-1 | [ami-04ebb4432c4397e2e](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04ebb4432c4397e2e) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04ebb4432c4397e2e)) |
| ap-southeast-1 | [ami-0217796240e307162](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0217796240e307162) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0217796240e307162)) |
| ap-southeast-2 | [ami-0142f8bf8086dfd0c](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0142f8bf8086dfd0c) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0142f8bf8086dfd0c)) |
| ca-central-1 | [ami-0247aee175851e274](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0247aee175851e274) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0247aee175851e274)) |
| eu-central-1 | [ami-0c91f38db398f2f7f](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c91f38db398f2f7f) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0c91f38db398f2f7f)) |
| eu-north-1 | [ami-002e8129cc99fd093](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-002e8129cc99fd093) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-002e8129cc99fd093)) |
| eu-west-1 | [ami-0fee135c59cc71f25](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fee135c59cc71f25) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0fee135c59cc71f25)) |
| eu-west-2 | [ami-0310b08601e54617c](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0310b08601e54617c) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0310b08601e54617c)) |
| eu-west-3 | [ami-073c30e97d249582c](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-073c30e97d249582c) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-073c30e97d249582c)) |
| sa-east-1 | [ami-0e2101521aaea4e64](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e2101521aaea4e64) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0e2101521aaea4e64)) |
| us-east-1 | [ami-0ec61d009ea7c2ebf](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0ec61d009ea7c2ebf) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0ec61d009ea7c2ebf)) |
| us-east-2 | [ami-0b5da2ec658fc5f22](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b5da2ec658fc5f22) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0b5da2ec658fc5f22)) |
| us-west-1 | [ami-0a581a1332d5ab453](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a581a1332d5ab453) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a581a1332d5ab453)) |
| us-west-2 | [ami-0c5e68fa70b5ebec3](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c5e68fa70b5ebec3) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0c5e68fa70b5ebec3)) |

</p></details>
