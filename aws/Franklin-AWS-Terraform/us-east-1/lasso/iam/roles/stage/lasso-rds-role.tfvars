role_name							= "lasso-rds-role-stage"
iam_role_desc						= "Grant RDS access to secret manager Stage"
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
lasso_secrets_manager_policy_arn	= "arn:aws:iam::702230634984:policy/lasso-secrets-manager-policy-stage"