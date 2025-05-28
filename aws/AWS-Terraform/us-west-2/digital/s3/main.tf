module "s3_bucket" {
  source ="../../../modules/storage/s3/s3-bucket/"
  
  s3_bucketName                         = var.bucket_short_name
  environment                           = var.environment
  force_destroy                         = var.force_destroy 
  create_ins_bucket_policy              = var.create_ins_bucket_policy 
  create_captiva_landing_zone_policy    = var.create_captiva_landing_zone_policy 
  tags                                  = var.tags
  logging                               = var.logging 
  acl                                   = var.acl
  s3_logging_bucketName                 = var.logging_bucket_name 
  logging_bucket_base_prefix            = var.logging_bucket_base_prefix 
  allowed_captiva_user_iam_arn_list     = var.allowed_captiva_user_iam_arn_list 
  allowed_ins_users_iam_arn_list        = var.allowed_ins_users_iam_arn_list 
  s3_authorized_ip_list                 = var.s3_authorized_ip_list 
  s3_vpc_endpoint                       = var.s3_vpc_endpoint 
  sqs_event_notification_arn            = var.sqs_event_notification_arn 
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
  sns_event_notification_arn            = var.sns_event_notification_arn 
  lifecycle_prefix						= var.lifecycle_prefix 
  aws_referer							= var.aws_referer 
  create_customer_communication_policy  = var.create_customer_communication_policy 
  allow_api_user_policy                 = var.allow_api_user_policy
  allowed_api_user_list                 = var.allowed_api_user_list
  allowed_read_only_user_list           = var.allowed_read_only_user_list
  fmservice_vanity_bucket_policy		= var.fmservice_vanity_bucket_policy
  fmservice_vanity_biz_user_arn			= var.fmservice_vanity_biz_user_arn
  enforce_bucket_owner					= var.enforce_bucket_owner
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