hermes-ses-access-policy = true
iam_policy_name              = "hermes-ses-access-policy-stage"
parameter_arn = [
                "arn:aws:ses:us-east-1:702230634984:configuration-set/",
                "arn:aws:ses:us-east-1:702230634984:identity/",
				"arn:aws:ses:us-east-1:702230634984:template/"
            ]
iam_role_id             = "hermes-ecs-task-execution-role-stage"
iam_policy_desc         = "Policy to provide permission for various SES actions in ECS"
iam_policy_tags				= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "06112024",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "07122024",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
	}