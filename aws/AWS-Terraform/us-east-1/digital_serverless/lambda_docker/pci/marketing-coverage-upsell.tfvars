lambda_function_name = "marketing-coverage-upsell-pci"
role = "arn:aws:iam::601751840347:role/digital-lambda-docker-role-pci"
description = "marketing lambda for coverage-upsell"
env_variables = {
		"MARKETING_SECRET_NAME"		=	"marketing-vanity-secrets-pci"
		"spring_profiles_active"	=	"prod"
	}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "07222024",
	"DataClassification": "PCI",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "07222024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-03922a05400d650c8"]
publish = false
image_uri = "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-digital:marketing-coverage-upsell-pci"
