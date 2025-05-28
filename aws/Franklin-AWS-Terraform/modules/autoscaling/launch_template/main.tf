resource "aws_launch_template" "launch_template" {
  name = var.template_name
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = var.template_tags
  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
	security_groups = var.lt_security_groups
  }
  update_default_version = var.update_default_version
  /*ebs_optimized = var.ebs_optimized
  
  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size = var.ebs_volume
      delete_on_termination = var.ebs_delete
      encrypted = var.ebs_encrypted
      volume_type = var.ebs_volume_type
    }
  }*/

  monitoring{
    enabled = var.launch_template_monitoring
  }

  tag_specifications {
    resource_type = var.resource_type
    tags = var.resource_tags
  }
    metadata_options {
      http_tokens                 = "optional"
    }  
}