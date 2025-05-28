resource "aws_ami_from_instance" "get_ami" {
  name               = var.name
  source_instance_id = var.source_instance_id
  tags = var.tags
}