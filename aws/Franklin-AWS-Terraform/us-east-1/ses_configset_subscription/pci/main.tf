module "ses_config_set_subscription" {
    source ="../../../modules/ses/config_set_subscription"
    aws_ses_configuration_set_name             = "${var.aws_ses_configuration_set_name}"
	ses_destination_name="${var.ses_destination_name}"
	aws_sns_topic_arn="${var.aws_sns_topic_arn}"
	matching_types="${var.matching_types}"

}