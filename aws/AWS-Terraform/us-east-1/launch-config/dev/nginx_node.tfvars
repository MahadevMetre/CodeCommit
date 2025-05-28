config_name = "nginx-dig-node-config-dev"
image_id = "ami-09d3831fb93c3d67c"
instance_type = "c4.large"
key_name = "EC2-Dev-key"
security_groups = ["sg-0a02311a28b939f42",
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