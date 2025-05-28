module "default_key" {
    source = "../../../modules/kms"
  key_arn = var.key_arn
}