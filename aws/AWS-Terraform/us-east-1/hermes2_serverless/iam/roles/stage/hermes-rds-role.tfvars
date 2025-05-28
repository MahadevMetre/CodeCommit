role_name							= "hermes-rds-role-stage"
iam_role_desc						= "Grant RDS access to secret manager Stage"
role_tags							= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "08032023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "08032023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
hermes-secrets-manager-policy		= true
hermes_secrets_manager_policy_arn	= "arn:aws:iam::702230634984:policy/hermes-secrets-manager-policy-stage"