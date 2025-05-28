module "cc_repo" {
  source                   = "../../modules/cc_repo/"
  repository_name           = var.repository_name
  description               = var.description
#   customer_managed_key_arn  = var.customer_managed_key_arn
  kms_key_id        = var.kms_key_id
  tags                      = var.tags
}
