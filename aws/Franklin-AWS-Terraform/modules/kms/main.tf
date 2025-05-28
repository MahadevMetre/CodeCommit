resource "aws_ebs_default_kms_key" "default_key" {
  key_arn = var.key_arn
}