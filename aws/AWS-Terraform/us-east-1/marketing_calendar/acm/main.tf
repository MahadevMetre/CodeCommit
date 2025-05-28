module "cert" {
  source		= "../../../modules/loadbalancing/acm/"
  domain_name	= var.domain_name
  validation	= var.validation
  tags			= var.tags
  subject_alternative_names = var.subject_alternative_names
}