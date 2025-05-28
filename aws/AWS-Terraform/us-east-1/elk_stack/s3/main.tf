module "s3_bucket" {
  source ="../../../modules/storage/s3/s3-bucket/"
  s3_bucketName                         = var.bucket_short_name
  environment                           = var.environment
  tags                                  = var.tags
  acl                                   = var.acl
  s3_logging_bucketName                 = var.logging_bucket_name
  logging_bucket_base_prefix            = var.logging_bucket_base_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "my_lifecycle_config" {
  count = var.s3_enable_lifecycle_config ? 1 : 0
  bucket = "${var.bucket_short_name}-${var.environment}"
  rule {
	id = "Delete_After_${var.s3_lifecycle_days}_Days"
	status = "Enabled"
	expiration {
		days = var.s3_lifecycle_days
	}
  }
}