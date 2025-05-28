module "vpc_link" {
  source  = "../../../modules/vpc_link"
  name        = var.name
  description = var.description
  target_arns = var.target_arns
  tags        = var.tags
}
