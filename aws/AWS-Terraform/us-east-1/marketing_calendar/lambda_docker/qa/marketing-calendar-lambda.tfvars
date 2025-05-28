lambda_function_name = "marketing-calendar-lambda-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "marketing lambda for calendar story"
env_variables = {
		MARKETING_SECRET_NAME		=	"marketing-vanity-secrets-qa"
	}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "09242024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "09242024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 30
subnets = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups = ["sg-0e0bde4366d2b3a7d"]
publish = false
image_uri = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-calendar-lambda-qa"