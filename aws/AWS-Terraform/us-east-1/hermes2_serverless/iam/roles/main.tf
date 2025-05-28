module "role" {
	source									= "../../../../modules/iam/roles/"
	role_name								= var.role_name
	role_tags								= var.role_tags
	iam_role_desc							= var.iam_role_desc
	hermes-secrets-manager-policy			= var.hermes-secrets-manager-policy
	hermes_secrets_manager_policy_arn		= var.hermes_secrets_manager_policy_arn
	lambda_vpc_connect						= var.lambda_vpc_connect
}