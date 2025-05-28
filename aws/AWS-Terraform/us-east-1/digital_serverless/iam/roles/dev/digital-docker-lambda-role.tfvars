role_name							= "digital-lambda-docker-role-dev"
iam_role_desc						= "Allows Lambda to call AWS services Dev"
role_tags							= {
		"Department": "DGT"
        "LastUpdated": "04222024"
        "CostCenter":  "FMG"
        "CreatedOn": "04032024"
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
lambda_invoke_policy_arn			= "arn:aws:iam::116762271881:policy/digital-lambda-invoke-policy-dev"
digital-logger-policy				= true
digital_logger_policy_arn			= "arn:aws:iam::116762271881:policy/digital-logger-policy-dev"
digital-secrets-manager-policy		= true
digital_secrets_manager_policy_arn	= "arn:aws:iam::116762271881:policy/digital-secrets-manager-policy-dev"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::116762271881:policy/digital-vpc-access-policy-dev"
digital-ecr-docker-policy			= true
digital_ecr_docker_policy_arn		= "arn:aws:iam::116762271881:policy/digital-ecr-docker-policy-dev"