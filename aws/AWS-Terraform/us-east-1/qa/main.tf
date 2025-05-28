# Define EBS Volume (without encryption)
resource "aws_ebs_volume" "storage" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  tags              = var.common_tags
}

# Define EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.public_ip_bool
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  disable_api_termination     = var.disable_api_termination

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    tags                  = var.common_tags
  }

  tags = var.common_tags
  instance_initiated_shutdown_behavior = "stop"
}

# Define EBS Volume Attachment (disabled by default)
resource "aws_volume_attachment" "connect_ebs" {
  count       = var.attach_ebs_volume ? 1 : 0
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.storage.id
  instance_id = aws_instance.ec2_instance.id
}

# Define Security Group
resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = var.common_tags

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
}
