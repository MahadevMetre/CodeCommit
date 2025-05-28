module "iam_user" {
	source					= "../../../../modules/iam/users/"
	iam_user_name			= var.iam_user_name
	iam_user_tags			= var.iam_user_tags
	iam_policy_name			= var.iam_policy_name
	cognito_admin_policy	= var.cognito_admin_policy
	ses_policy				= var.ses_policy
}