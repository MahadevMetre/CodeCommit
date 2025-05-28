module "sns_topic" {
    source ="../../../modules/sns/sns_topic/"
    sns_topic_name                  = var.sns_topic_name
    s3_bucket_arn_list              = var.s3_bucket_arn_list
    s3_pub_access_policy_bool       = var.s3_pub_access_policy_bool
    standard_pub_access_policy_bool = var.standard_pub_access_policy_bool
    create_subscriptions_bool       = var.create_subscriptions_bool
    subscriptions                   = var.subscriptions
    tags                            = var.tags
	ses_access_policy				= var.ses_access_policy
	source_owner 					= var.source_owner
    autoscaling_policy              = var.autoscaling_policy
}