module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				= var.iam_policy_name
	iam_policy_desc				= var.iam_policy_desc
	iam_policy_tags				= var.iam_policy_tags
	hermes_archival_process_policy	= var.hermes_archival_process_policy
	hermes_file_process_policy		= var.hermes_file_process_policy
	hermes_file_integration_policy	= var.hermes_file_integration_policy
	hermes_secrets_mgr_policy		= var.hermes_secrets_mgr_policy
	hermes_s3_access_policy			= var.hermes_s3_access_policy
	pycharm_aws_user_policy			= var.pycharm_aws_user_policy
	hermes-ses-access-policy		= var.hermes-ses-access-policy
	iam_role_id						= var.iam_role_id
	parameter_arn					= var.parameter_arn
}