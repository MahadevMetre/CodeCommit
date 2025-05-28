module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				= var.iam_policy_name
	iam_policy_desc				= var.iam_policy_desc
	iam_policy_tags				= var.iam_policy_tags
	lambda_invoke_policy		= var.lambda_invoke_policy
	lasso_logger_policy			= var.lasso_logger_policy
	lasso_log_group_arn			= var.lasso_log_group_arn
	lasso_rds_proxy_policy		= var.lasso_rds_proxy_policy
	lasso_rds_dbuser_arn		= var.lasso_rds_dbuser_arn
	lasso_s3_access_policy		= var.lasso_s3_access_policy
	bucket_env					= var.bucket_env
	lasso_secrets_mgr_policy	= var.lasso_secrets_mgr_policy
	lasso_vpc_access_policy		= var.lasso_vpc_access_policy
	ses_access_policy			= var.ses_access_policy
	lasso_kms_policy			= var.lasso_kms_policy
}