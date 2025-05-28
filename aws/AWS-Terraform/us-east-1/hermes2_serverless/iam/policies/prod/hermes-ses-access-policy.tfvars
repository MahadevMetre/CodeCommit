hermes-ses-access-policy = true
iam_policy_name              = "hermes-ses-access-policy-prod"
parameter_arn = [
                "arn:aws:ses::361469336240:configuration-set/",
                "arn:aws:ses::361469336240:identity/",
				"arn:aws:ses::361469336240:template/"
            ]
iam_role_id             = "hermes-ecs-task-execution-role-prod"
iam_policy_desc         = "Policy to provide permission for various SES actions in ECS"
iam_policy_tags				= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "06262024",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "06262024",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
	}