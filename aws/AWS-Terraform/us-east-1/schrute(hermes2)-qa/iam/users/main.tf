module "iam_user" {
	source						= "../../../../modules/iam/users/"
	iam_user_name				= var.iam_user_name
	iam_user_tags				= var.iam_user_tags
	iam_policy_name				= var.iam_policy_name
	hermes_archival_process_policy	= var.hermes_archival_process_policy
	hermes_file_process_policy		= var.hermes_file_process_policy
	hermes_file_integration_policy	= var.hermes_file_integration_policy
	pycharm_aws_user_policy			= var.pycharm_aws_user_policy
}