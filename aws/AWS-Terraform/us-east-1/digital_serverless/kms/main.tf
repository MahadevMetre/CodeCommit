module "key" {
  source = "../../../modules/kms-WithPolicy/"
  description     = var.description
  key_usage       = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  is_enabled      = var.is_enabled
  enable_key_rotation = var.enable_key_rotation
  tags            = var.tags
  parameter_policy = var.parameter_policy
  alias_name            = var.alias_name
  iam_arn         = var.iam_arn
  iam_roles       = var.iam_roles
  storage-encryption_policy = var.storage-encryption_policy
  storage_roles   = var.storage_roles
  marketing-kms-policy = var.marketing-kms-policy
  multi_region             = var.multi_region
}