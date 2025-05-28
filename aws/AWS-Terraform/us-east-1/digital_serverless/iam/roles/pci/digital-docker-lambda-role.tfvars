role_name							= "digital-lambda-docker-role-pci"
iam_role_desc						= "Allows Lambda to call AWS services PCI"
role_tags							= {
		"Department": "DGT"
        "LastUpdated": "07222024"
        "CostCenter":  "FMG"
        "CreatedOn": "07222024"
        "DataClassification": "PCI"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Digital"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "DevOps"
    }
lambda-invoke-policy				= true
lambda_invoke_policy_arn			= "arn:aws:iam::601751840347:policy/digital-lambda-invoke-policy-pci"
digital-logger-policy				= true
digital_logger_policy_arn			= "arn:aws:iam::601751840347:policy/digital-logger-policy-pci"
digital-secrets-manager-policy		= true
digital_secrets_manager_policy_arn	= "arn:aws:iam::601751840347:policy/digital-secrets-manager-policy-pci"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::601751840347:policy/digital-vpc-access-policy-pci"
digital-ecr-docker-policy			= true
digital_ecr_docker_policy_arn		= "arn:aws:iam::601751840347:policy/digital-ecr-docker-policy-pci"