resource "aws_codecommit_repository" "this" {
  repository_name = var.repository_name
  description     = var.description
  kms_key_id = var.kms_key_id
  tags = var.tags
}
