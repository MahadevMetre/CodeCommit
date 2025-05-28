resource "aws_launch_configuration" "launch_configuration" {
  name = var.config_name
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  associate_public_ip_address = var.associate_public_ip_address
  enable_monitoring = var.enable_monitoring
  ebs_optimized = var.ebs_optimized
  
  root_block_device {
    volume_size = var.root_size
    volume_type = var.root_volume_type
    encrypted = var.root_encrypted
  }
  
  ebs_block_device {
    device_name = var.device_name
    volume_size = var.ebs_volume
    delete_on_termination = var.ebs_delete
    encrypted = var.ebs_encrypted
    volume_type = var.ebs_volume_type
  }
  iam_instance_profile  = var.iam_instance_profile
}