role_name							= "lasso-lambda-role-pci"
iam_role_desc						= "Allows Lambda to call AWS services PCI"
role_tags							= {
		"Department": "LSO"
		"LastUpdated": "06152023"
		"CostCenter": "FMG"
		"CreatedOn": "08112022"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Lasso"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "saher"
	}
lambda-invoke-policy				= true
lambda_invoke_policy_arn			= "arn:aws:iam::601751840347:policy/lasso-lambda-invoke-policy-pci"
lasso-logger-policy					= true
lasso_logger_policy_arn				= "arn:aws:iam::601751840347:policy/lasso-logger-policy-pci"
lasso-rds-proxy-policy				= true
lasso_rds_proxy_policy_arn			= "arn:aws:iam::601751840347:policy/lasso-rds-proxy-policy-pci"
lasso-s3-access-policy				= true
lasso_s3_access_policy_arn			= "arn:aws:iam::601751840347:policy/lasso-s3-access-policy-pci"
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::601751840347:policy/lasso-secrets-manager-policy-pci"
lasso-vpc-access-policy				= true
lasso_vpc_access_policy_arn			= "arn:aws:iam::601751840347:policy/lasso-vpc-access-policy-pci"
ses-access-policy					= true
ses_access_policy_arn				= "arn:aws:iam::601751840347:policy/lasso-ses-access-policy-pci"
eventbridge_scheduler_source_arn	= "arn:aws:scheduler:us-east-1:601751840347:schedule/lasso*"