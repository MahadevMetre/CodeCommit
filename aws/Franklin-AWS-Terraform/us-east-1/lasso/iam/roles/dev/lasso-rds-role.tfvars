role_name							= "lasso-rds-role-dev"
iam_role_desc						= "Grant RDS access to secret manager Dev"
role_tags							= {
		"Department": "LSO"
		"LastUpdated": "07142022"
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
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::116762271881:policy/lasso-secrets-manager-policy-dev"