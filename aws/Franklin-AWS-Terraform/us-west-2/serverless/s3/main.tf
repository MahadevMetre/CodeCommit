module "s3_bucket" {
  source ="../../../modules/storage/s3/s3-bucket/"
  s3_bucketName                         = var.bucket_short_name
  environment                           = var.environment
  tags                                  = var.tags
  acl                                   = var.acl
  s3_logging_bucketName                 = var.logging_bucket_name
  logging_bucket_base_prefix            = var.logging_bucket_base_prefix
  allowed_read_only_user_list			= var.allowed_read_only_user_list
  event_id								= var.event_id
  events                                = var.events
  filter_prefix                         = var.filter_prefix
  filter_suffix                         = var.filter_suffix
  insclaimsbockserver_policy			= var.insclaimsbockserver_policy
  allow_ses_put_policy					= var.allow_ses_put_policy
  versioning_enabled_bool				= var.versioning_enabled_bool
  bucket_notification_lambda_enabled	= var.bucket_notification_lambda_enabled
  lambda_event_triggers					= var.lambda_event_triggers
  lambda_notification_function_arn		= var.lambda_notification_function_arn
  replication                           = var.replication
  replication_id                        = var.replication_id
  iam_role_replication_arn              = var.iam_role_replication_arn
  s3_destination_arn                    = var.s3_destination_arn
  status                                = var.status
  hermes_batch_processor_policy			= var.hermes_batch_processor_policy
  pycharm_serverless_bucket_policy		= var.pycharm_serverless_bucket_policy
  replication_policy_prodtodr           = var.replication_policy_prodtodr
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
	abort_incomplete_multipart_upload {
		days_after_initiation = 3
	}
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  count = var.s3_eventbridge_notifications ? 1 : 0
  bucket = "${var.bucket_short_name}-${var.environment}"
  eventbridge = true
}