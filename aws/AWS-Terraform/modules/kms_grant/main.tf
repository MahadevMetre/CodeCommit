resource "aws_kms_grant" "kms_grant" {
  name              = var.name
  key_id            = var.key_id
  grantee_principal = var.iam_arn
  operations        = var.operations
}