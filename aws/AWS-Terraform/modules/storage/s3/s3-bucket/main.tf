resource "aws_s3_bucket" "s3_bucket" {
  bucket              = "${var.s3_bucketName}-${var.environment}"
  acl                 = var.acl
  tags                = var.tags
  force_destroy       = var.force_destroy
  
  versioning {
	enabled = var.versioning_enabled_bool
	mfa_delete = var.mfa_delete
  }
  
   //lifecycle_rule {
     //enabled = var.lifecycle_enabled_bool
     //tags = var.lifecycle_tags
	 //id = var.lifecycle_id
	 //prefix = var.lifecycle_prefix
	 //transition {
		 //days = var.lifecycle_transition_days
		 //storage_class = var.lifecycle_storage_class
	  //}
    //}
	
  logging {
    target_bucket = var.s3_logging_bucketName
    target_prefix = "${var.logging_bucket_base_prefix}/${var.s3_bucketName}-${var.environment}/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Ignore changes to logging changes made manually
  // lifecycle {
    // ignore_changes = [logging]
  // }

}

resource "aws_s3_bucket_ownership_controls" "OwnerShip" {
  count = var.enforce_bucket_owner ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "block-public-access" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

module "s3-bucket-policy" {
  source                            = "../s3-policy/"
  s3_bucketName                     = aws_s3_bucket.s3_bucket.id
  bucket_arn						= aws_s3_bucket.s3_bucket.arn
  create_ins_bucket_policy          = var.create_ins_bucket_policy
  create_captiva_landing_zone_policy= var.create_captiva_landing_zone_policy
  create_platformconfig_bucket_policy= var.create_platformconfig_bucket_policy
  allowed_captiva_user_iam_arn_list = var.allowed_captiva_user_iam_arn_list
  allowed_ins_users_iam_arn_list    = var.allowed_ins_users_iam_arn_list
  s3_authorized_ip_list             = var.s3_authorized_ip_list
  s3_vpc_endpoint                   = var.s3_vpc_endpoint
  aws_referer						= var.aws_referer
  create_customer_communication_policy = var.create_customer_communication_policy
  allow_api_user_policy             = var.allow_api_user_policy
  allow_api_user_policy_dr          = var.allow_api_user_policy_dr
  replication_policy_dr             = var.replication_policy_dr
  allowed_api_user_list             = var.allowed_api_user_list
  allowed_read_only_user_list       = var.allowed_read_only_user_list
  cloudfront_oai_policy				= var.cloudfront_oai_policy
  cloudfront_oai_arn				= var.cloudfront_oai_arn
  insclaimsbockserver_policy		= var.insclaimsbockserver_policy
  allow_ses_put_policy				= var.allow_ses_put_policy
  insclaimsbockserver_policy_dr     = var.insclaimsbockserver_policy_dr
  fmservice_vanity_bucket_policy	= var.fmservice_vanity_bucket_policy
  fmservice_vanity_biz_user_arn		= var.fmservice_vanity_biz_user_arn
  hermes_batch_processor_policy		= var.hermes_batch_processor_policy
  pycharm_serverless_bucket_policy	= var.pycharm_serverless_bucket_policy
  replication_policy_prodtodr       = var.replication_policy_prodtodr
  marketing_vanity_bucket_policy	= var.marketing_vanity_bucket_policy
  marketing_vanity_allowed_users_list = var.marketing_vanity_allowed_users_list
  ecs_alb                           = var.ecs_alb
  insurancenontermcabinet_policy    = var.insurancenontermcabinet_policy
  enable_ses_bucket_policy          = var.enable_ses_bucket_policy
} 


resource "aws_s3_bucket_notification" "bucket_notification_sqs" {
  count = var.bucket_notification_sqs_enabled ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  queue {
    queue_arn      = var.sqs_event_notification_arn
    events         = var.events
    filter_prefix  = var.filter_prefix
    filter_suffix  = var.filter_suffix
  }
}

resource "aws_s3_bucket_notification" "bucket_notification_sns" {
  count = var.bucket_notification_sns_enabled ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  topic {
    topic_arn      = var.sns_event_notification_arn
    events         = var.events
    filter_prefix  = var.filter_prefix
    filter_suffix  = var.filter_suffix
  }
}

resource "aws_s3_bucket_notification" "bucket_notification_lambda" {
  count = var.bucket_notification_lambda_enabled ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  dynamic "lambda_function" {
	for_each			= var.lambda_event_triggers
	content {
		lambda_function_arn = lambda_function.value.lambda_notification_function_arn
		events              = lambda_function.value.events
		filter_prefix       = lambda_function.value.filter_prefix
		filter_suffix       = lambda_function.value.filter_suffix
		id					= lambda_function.value.event_id
	}
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
     count = var.replication ? 1 : 0
	 role = var.iam_role_replication_arn
	 bucket = aws_s3_bucket.s3_bucket.id
	 rule {
		 status = var.status
		 id = var.replication_id
		 destination {
			 bucket	= var.s3_destination_arn  
	  }
   }
}