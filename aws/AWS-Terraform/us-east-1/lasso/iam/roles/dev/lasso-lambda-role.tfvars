role_name							= "lasso-lambda-role-dev"
iam_role_desc						= "Allows Lambda to call AWS services Dev"
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
lambda_invoke_policy_arn			= "arn:aws:iam::116762271881:policy/lasso-lambda-invoke-policy-dev"
lasso-logger-policy					= true
lasso_logger_policy_arn				= "arn:aws:iam::116762271881:policy/lasso-logger-policy-dev"
lasso-rds-proxy-policy				= true
lasso_rds_proxy_policy_arn			= "arn:aws:iam::116762271881:policy/lasso-rds-proxy-policy-dev"
lasso-s3-access-policy				= true
lasso_s3_access_policy_arn			= "arn:aws:iam::116762271881:policy/lasso-s3-access-policy-dev"
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::116762271881:policy/lasso-secrets-manager-policy-dev"
lasso-vpc-access-policy				= true
lasso_vpc_access_policy_arn			= "arn:aws:iam::116762271881:policy/lasso-vpc-access-policy-dev"
ses-access-policy					= true
ses_access_policy_arn				= "arn:aws:iam::116762271881:policy/lasso-ses-access-policy-dev"
eventbridge_scheduler_source_arn	= "arn:aws:scheduler:us-east-1:116762271881:schedule/lasso*"