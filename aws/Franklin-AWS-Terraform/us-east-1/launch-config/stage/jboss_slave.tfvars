config_name = "jboss_slave_config"
image_id = "ami-0ccdad80a32afd94b"
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