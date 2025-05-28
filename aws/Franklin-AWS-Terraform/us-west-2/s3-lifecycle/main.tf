resource "aws_s3_bucket_lifecycle_configuration" "my_lifecycle_config" {
  bucket = var.bucket_name
  rule {
	id = "Delete_After_${var.s3_lifecycle_days}_Days"
	status = "Enabled"
	expiration {
		days = var.s3_lifecycle_days
	}
	noncurrent_version_expiration {
		newer_noncurrent_versions = var.noncurrent_version_expiration
		noncurrent_days 		  = var.noncurrent_days
	}
  }
}