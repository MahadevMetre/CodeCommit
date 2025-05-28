resource "aws_ebs_volume" "storage" {
  count             = var.ebs_enabled ? 1 : 0 
  availability_zone = var.ec2_region
  size              = var.ebs2_size 
  type              = var.volume_type 
  tags              = var.ebs_tags 
  encrypted         = var.ebs_encrypted 
  kms_key_id        = var.kms_key_id 
}

resource "aws_instance" "ec2_instance" {
  ami                           = var.ami
  instance_type                 = var.instance_type
  availability_zone             = var.ec2_region
  associate_public_ip_address   = var.public_ip_bool
  key_name                      = var.key_name
  vpc_security_group_ids		= var.security_groups
  subnet_id                     = var.subnet_id
  tags                          = var.tags
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  root_block_device {
    volume_size              = var.ebs_size
    volume_type              = var.volume_type
    encrypted             = var.ebs_encrypted
    kms_key_id        = var.kms_key_id
    delete_on_termination = var.root_delete
	tags = var.ebs_tags
  }
  private_ip                   = var.private_ip
  disable_api_termination = true
}

resource "aws_volume_attachment" "connect_ebs" {
 count             = var.ebs_enabled ? 1 : 0 
 device_name = var.device_name 
 volume_id = aws_ebs_volume.storage[count.index].id
 instance_id = aws_instance.ec2_instance.id
}