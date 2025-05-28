module "cert" {
  source = "../../../modules/loadbalancing/acm/"
  domain_name       = var.domain_name
  validation = var.validation
  tags = var.tags
}