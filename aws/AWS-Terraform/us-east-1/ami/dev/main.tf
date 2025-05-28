module "get_ami" {
  source = "../../../modules/autoscaling/ami_from_instance"
  name               = var.name
  source_instance_id = var.source_instance_id
  tags = var.tags
}