role_name							= "hermes-rds-role-prod"
iam_role_desc						= "Grant RDS access to secret manager Prod"
role_tags							= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "08212023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "08212023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
hermes-secrets-manager-policy		= true
hermes_secrets_manager_policy_arn	= "arn:aws:iam::361469336240:policy/hermes-secrets-manager-policy-prod"