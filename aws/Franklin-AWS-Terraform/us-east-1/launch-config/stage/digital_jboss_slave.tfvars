config_name = "jboss_dig-node-config-stage"
image_id = "ami-04de114f6cba8b597"
instance_type = "c4.large"
key_name = "EC2-Stage-Key"
security_groups = ["sg-0404a2805e92627ec",
    "sg-010670cd25f4a1a7c"]
associate_public_ip_address = false
enable_monitoring = true
ebs_optimized = true
root_size = 10
root_volume_type = "standard"
root_encrypted = true
device_name = "/dev/sdf"
ebs_volume = 30
ebs_delete = true
ebs_encrypted = true
ebs_volume_type = "gp2"