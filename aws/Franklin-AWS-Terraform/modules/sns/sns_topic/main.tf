resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "sns_subscriptions" {
  count                     = length(var.subscriptions)
  topic_arn                 = aws_sns_topic.sns_topic.arn
  protocol                  = "${element(var.subscriptions["subscription_${count.index}"], 0)}"
  endpoint                  = "${element(var.subscriptions["subscription_${count.index}"], 1)}"
}

module policy_sns {
  source                        = "../sns_policy/"
  sns_arn_val                   = aws_sns_topic.sns_topic.arn
  s3_bucket_arn_list            = var.s3_bucket_arn_list
  publisher                     = var.publisher
  standard_s3_pub_access_policy = var.s3_pub_access_policy_bool
  standard_pub_access_policy_bool = var.standard_pub_access_policy_bool
  ses_access_policy				= var.ses_access_policy
  source_owner 					= var.source_owner
  autoscaling_policy = var.autoscaling_policy
}