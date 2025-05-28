role_name							= "digital-lambda-docker-role-qa"
iam_role_desc						= "Allows Lambda to call AWS services qa"
role_tags							= {
		"Department": "DGT"
        "LastUpdated": "06132024"
        "CostCenter":  "FMG"
        "CreatedOn": "06132024"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Digital"
        "TechStack": "None"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "DevOps"
    }
lambda-invoke-policy				= true
lambda_invoke_policy_arn			= "arn:aws:iam::634621569833:policy/digital-lambda-invoke-policy-qa"
digital-logger-policy				= true
digital_logger_policy_arn			= "arn:aws:iam::634621569833:policy/digital-logger-policy-qa"
digital-secrets-manager-policy		= true
digital_secrets_manager_policy_arn	= "arn:aws:iam::634621569833:policy/digital-secrets-manager-policy-qa"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::634621569833:policy/digital-vpc-access-policy-qa"
digital-ecr-docker-policy			= true
digital_ecr_docker_policy_arn		= "arn:aws:iam::634621569833:policy/digital-ecr-docker-policy-qa"