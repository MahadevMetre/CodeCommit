role_name							= "hermes-rds-role-qa"
iam_role_desc						= "Grant RDS access to secret manager QA"
role_tags							= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "05092024",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "05092024",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
hermes-secrets-manager-policy		= true
hermes_secrets_manager_policy_arn	= "arn:aws:iam::634621569833:policy/hermes-secrets-manager-policy-qa"