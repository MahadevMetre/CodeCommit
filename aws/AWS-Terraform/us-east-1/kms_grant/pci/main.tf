module "kms_grant" {
  source            = "../../../modules/kms_grant"
  name              = var.name
  key_id            = var.key_id
  iam_arn           = var.iam_arn
  operations        = var.operations
}