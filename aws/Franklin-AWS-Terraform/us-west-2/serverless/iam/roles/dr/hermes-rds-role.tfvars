role_name							= "hermes-rds-role-dr"
iam_role_desc						= "Grant RDS access to secret manager DR"
role_tags							= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "02232024",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "02232024",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
hermes-secrets-manager-policy		= true
hermes_secrets_manager_policy_arn	= "arn:aws:iam::214946096060:policy/hermes-secrets-manager-policy-dr"