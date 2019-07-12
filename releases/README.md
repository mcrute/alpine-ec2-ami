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

### Alpine Linux 3.10.1 (2019-07-12)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-3.10.1-x86_64-r0 |
| ------ | --- |
| ap-northeast-1 | [ami-039a6734ca3e107c2](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-039a6734ca3e107c2) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-039a6734ca3e107c2)) |
| ap-northeast-2 | [ami-0fc9157e14e1701ea](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fc9157e14e1701ea) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fc9157e14e1701ea)) |
| ap-south-1 | [ami-0f704cf587a1bd591](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0f704cf587a1bd591) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0f704cf587a1bd591)) |
| ap-southeast-1 | [ami-04ee093ad3986c1e2](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04ee093ad3986c1e2) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04ee093ad3986c1e2)) |
| ap-southeast-2 | [ami-08b686d005668aa12](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08b686d005668aa12) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-08b686d005668aa12)) |
| ca-central-1 | [ami-073a7bdf1f93fdf07](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-073a7bdf1f93fdf07) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-073a7bdf1f93fdf07)) |
| eu-central-1 | [ami-02b0787907fb72c16](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-02b0787907fb72c16) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-02b0787907fb72c16)) |
| eu-north-1 | [ami-020c6eab877f87e9c](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-020c6eab877f87e9c) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-020c6eab877f87e9c)) |
| eu-west-1 | [ami-08f5d4eaae3855536](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-08f5d4eaae3855536) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-08f5d4eaae3855536)) |
| eu-west-2 | [ami-01fe12a7b5f0ae5e4](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01fe12a7b5f0ae5e4) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-01fe12a7b5f0ae5e4)) |
| eu-west-3 | [ami-07098b9dc4e34adee](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07098b9dc4e34adee) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-07098b9dc4e34adee)) |
| sa-east-1 | [ami-06b3a596069b29720](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-06b3a596069b29720) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-06b3a596069b29720)) |
| us-east-1 | [ami-0cce76b5f0a9c52f3](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0cce76b5f0a9c52f3) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0cce76b5f0a9c52f3)) |
| us-east-2 | [ami-0e0eea8fb3cea9bf6](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e0eea8fb3cea9bf6) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0e0eea8fb3cea9bf6)) |
| us-west-1 | [ami-0db3b834555de24aa](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0db3b834555de24aa) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0db3b834555de24aa)) |
| us-west-2 | [ami-01ddc73ca7c75f53d](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-01ddc73ca7c75f53d) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-01ddc73ca7c75f53d)) |

</p></details>

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

### Alpine Linux Edge (2019-07-12)
<details><summary><i>click to show/hide</i></summary><p>

| Region | alpine-ami-edge-x86_64-20190712152706 |
| ------ | --- |
| ap-northeast-1 | [ami-03529f4b01b3ff4d2](https://ap-northeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03529f4b01b3ff4d2) ([launch](https://ap-northeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03529f4b01b3ff4d2)) |
| ap-northeast-2 | [ami-033415c5ef8fc23a5](https://ap-northeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-033415c5ef8fc23a5) ([launch](https://ap-northeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-033415c5ef8fc23a5)) |
| ap-south-1 | [ami-0467b6e5e38f5085f](https://ap-south-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0467b6e5e38f5085f) ([launch](https://ap-south-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0467b6e5e38f5085f)) |
| ap-southeast-1 | [ami-03fe517dfde26c76d](https://ap-southeast-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-03fe517dfde26c76d) ([launch](https://ap-southeast-1.console.aws.amazon.com/ec2/home#launchAmi=ami-03fe517dfde26c76d)) |
| ap-southeast-2 | [ami-0c115523398cf0074](https://ap-southeast-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0c115523398cf0074) ([launch](https://ap-southeast-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0c115523398cf0074)) |
| ca-central-1 | [ami-030c1fe435b2a6b42](https://ca-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-030c1fe435b2a6b42) ([launch](https://ca-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-030c1fe435b2a6b42)) |
| eu-central-1 | [ami-0faa56a118e5d5107](https://eu-central-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0faa56a118e5d5107) ([launch](https://eu-central-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0faa56a118e5d5107)) |
| eu-north-1 | [ami-04dbb65ab0d53d6ae](https://eu-north-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-04dbb65ab0d53d6ae) ([launch](https://eu-north-1.console.aws.amazon.com/ec2/home#launchAmi=ami-04dbb65ab0d53d6ae)) |
| eu-west-1 | [ami-0b6628874c765750e](https://eu-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0b6628874c765750e) ([launch](https://eu-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0b6628874c765750e)) |
| eu-west-2 | [ami-07bb0e2fe1405fb68](https://eu-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-07bb0e2fe1405fb68) ([launch](https://eu-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-07bb0e2fe1405fb68)) |
| eu-west-3 | [ami-056ef01cbdab4ff2d](https://eu-west-3.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-056ef01cbdab4ff2d) ([launch](https://eu-west-3.console.aws.amazon.com/ec2/home#launchAmi=ami-056ef01cbdab4ff2d)) |
| sa-east-1 | [ami-0806e34494b838a44](https://sa-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0806e34494b838a44) ([launch](https://sa-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0806e34494b838a44)) |
| us-east-1 | [ami-0a43d81e6daed9bb6](https://us-east-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0a43d81e6daed9bb6) ([launch](https://us-east-1.console.aws.amazon.com/ec2/home#launchAmi=ami-0a43d81e6daed9bb6)) |
| us-east-2 | [ami-0fd554560b36e0626](https://us-east-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0fd554560b36e0626) ([launch](https://us-east-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0fd554560b36e0626)) |
| us-west-1 | [ami-079d3be78a25ec349](https://us-west-1.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-079d3be78a25ec349) ([launch](https://us-west-1.console.aws.amazon.com/ec2/home#launchAmi=ami-079d3be78a25ec349)) |
| us-west-2 | [ami-0e8ecf7c0ae98cb6a](https://us-west-2.console.aws.amazon.com/ec2/home#Images:visibility=public-images;imageId=ami-0e8ecf7c0ae98cb6a) ([launch](https://us-west-2.console.aws.amazon.com/ec2/home#launchAmi=ami-0e8ecf7c0ae98cb6a)) |

</p></details>
