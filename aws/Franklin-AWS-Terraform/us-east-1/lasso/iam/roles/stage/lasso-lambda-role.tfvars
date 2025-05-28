role_name							= "lasso-lambda-role-stage"
iam_role_desc						= "Allows Lambda to call AWS services Stage"
role_tags							= {
		"Department": "LSO"
		"LastUpdated": "05182023"
		"CostCenter": "FMG"
		"CreatedOn": "07142022"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Lasso"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "sbose"
	}
lambda-invoke-policy				= true
lambda_invoke_policy_arn			= "arn:aws:iam::702230634984:policy/lasso-lambda-invoke-policy-stage"
lasso-logger-policy					= true
lasso_logger_policy_arn				= "arn:aws:iam::702230634984:policy/lasso-logger-policy-stage"
lasso-rds-proxy-policy				= true
lasso_rds_proxy_policy_arn			= "arn:aws:iam::702230634984:policy/lasso-rds-proxy-policy-stage"
lasso-s3-access-policy				= true
lasso_s3_access_policy_arn			= "arn:aws:iam::702230634984:policy/lasso-s3-access-policy-stage"
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::702230634984:policy/lasso-secrets-manager-policy-stage"
lasso-vpc-access-policy				= true
lasso_vpc_access_policy_arn			= "arn:aws:iam::702230634984:policy/lasso-vpc-access-policy-stage"
ses-access-policy					= true
ses_access_policy_arn				= "arn:aws:iam::702230634984:policy/lasso-ses-access-policy-stage"
eventbridge_scheduler_source_arn	= "arn:aws:scheduler:us-east-1:702230634984:schedule/lasso*"