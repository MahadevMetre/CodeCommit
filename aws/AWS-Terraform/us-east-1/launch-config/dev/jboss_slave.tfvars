config_name = "jboss_slave_config"
image_id = "ami-075f989d6c28c0997"
instance_type = "c4.large"
key_name = "EC2-Dev-key"
security_groups = ["sg-037f5b5bb9a9bc966",
    "sg-0dec3c563b782653b"]
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