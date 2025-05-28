module "role" {
	source									= "../../../../modules/iam/roles/"
	policy_name								= var.policy_name
	role_name								= var.role_name
	role_tags								= var.role_tags
	iam_role_desc							= var.iam_role_desc
	lambda-invoke-policy					= var.lambda-invoke-policy
	lambda_invoke_policy_arn				= var.lambda_invoke_policy_arn
	digital-logger-policy					= var.digital-logger-policy
	digital_logger_policy_arn				= var.digital_logger_policy_arn
	digital-secrets-manager-policy			= var.digital-secrets-manager-policy
	digital_secrets_manager_policy_arn		= var.digital_secrets_manager_policy_arn
	digital-vpc-access-policy				= var.digital-vpc-access-policy
	digital_vpc_access_policy_arn			= var.digital_vpc_access_policy_arn
	digital-ecr-docker-policy				= var.digital-ecr-docker-policy
	digital_ecr_docker_policy_arn			= var.digital_ecr_docker_policy_arn
	eventbridge_scheduler_source_arn		= var.eventbridge_scheduler_source_arn
}