module "iam_policy" {
	source					= "../../../../modules/iam/user_policy/"
	iam_policy_name			= var.iam_policy_name
	iam_policy_tags			= var.iam_policy_tags
	cognito_admin_policy	= var.cognito_admin_policy
}