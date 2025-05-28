module "s3_bucket" {
  source ="../../../modules/storage/s3/s3-bucket/"
  s3_bucketName                         = var.bucket_short_name
  environment                           = var.environment
  tags                                  = var.tags
  logging                               = var.logging 
  acl                                   = var.acl
  s3_logging_bucketName                 = var.logging_bucket_name 
  logging_bucket_base_prefix            = var.logging_bucket_base_prefix 
  events                                = var.events
  filter_prefix                         = var.filter_prefix
  filter_suffix                         = var.filter_suffix
  lifecycle_tags						= var.lifecycle_tags 
  lifecycle_enabled_bool				= var.lifecycle_enabled_bool 
  lifecycle_transition_days				= var.lifecycle_transition_days 
  lifecycle_storage_class				= var.lifecycle_storage_class 
  versioning_enabled_bool				= var.versioning_enabled_bool 
  mfa_delete							= var.mfa_delete 
  lifecycle_id							= var.lifecycle_id 
  lifecycle_prefix						= var.lifecycle_prefix 
  aws_referer							= var.aws_referer 
  fmservice_vanity_bucket_policy		= var.fmservice_vanity_bucket_policy
  fmservice_vanity_biz_user_arn			= var.fmservice_vanity_biz_user_arn
  enforce_bucket_owner					= var.enforce_bucket_owner
  bucket_notification_lambda_enabled	= var.bucket_notification_lambda_enabled
  lambda_event_triggers					= var.lambda_event_triggers
  lambda_notification_function_arn		= var.lambda_notification_function_arn
  event_id								= var.event_id
  marketing_vanity_bucket_policy		= var.marketing_vanity_bucket_policy
  marketing_vanity_allowed_users_list	= var.marketing_vanity_allowed_users_list
  enable_ses_bucket_policy              = var.enable_ses_bucket_policy

}


resource "aws_iam_user" "fmservice_vanity_jenkins_user" {
	count =	var.create_fmservice_vanity_iam_user ? 1 : 0
	name = "fmservice_vanity_jenkins_user_${var.environment}"
	tags = var.iam_user_tags
}

resource "aws_iam_user_policy" "fmservice_vanity_jenkins_user_policy" {
	count			=	var.create_fmservice_vanity_iam_user ? 1 : 0
	name			=	"fmservice_vanity_jenkins_user_policy"
	user			=	aws_iam_user.fmservice_vanity_jenkins_user[0].name
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${var.bucket_short_name}-${var.environment}/Vanity_*.xlsx"
        },
        {
            "Action": "ec2:DescribeInstances",
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
})
}

resource "aws_s3_bucket_policy" "ses_bucket_policy" {
  bucket = module.s3_bucket.s3_bucketName

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ses.amazonaws.com"
        },
        "Action": [
          "s3:PutObject",
          "s3:GetBucketLocation"
        ],
        "Resource": "arn:aws:s3:::${module.s3_bucket.s3_bucketName}/*"
      }
    ]
  })
}
