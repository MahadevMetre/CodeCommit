hermes-ses-access-policy = true
iam_policy_name              = "hermes-ses-access-policy-dr"
parameter_arn = [
                "arn:aws:ses::214946096060:configuration-set/",
                "arn:aws:ses::214946096060:identity/",
				"arn:aws:ses::214946096060:template/"
            ]
iam_role_id             = "hermes-ecs-task-execution-role-dr"
iam_policy_desc         = "Policy to provide permission for various SES actions in ECS"
iam_policy_tags				= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "09182024",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "09182024",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
	}