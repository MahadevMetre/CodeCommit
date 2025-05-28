module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				= var.iam_policy_name
	iam_policy_desc				= var.iam_policy_desc
	iam_policy_tags				= var.iam_policy_tags
	lambda_invoke_policy		= var.lambda_invoke_policy
	digital_logger_policy	    = var.digital_logger_policy
	digital_log_group_arn		= var.digital_log_group_arn
	digital_secrets_mgr_policy	= var.digital_secrets_mgr_policy
	digital_vpc_access_policy	= var.digital_vpc_access_policy
	digital_ecr_docker_policy   = var.digital_ecr_docker_policy
}