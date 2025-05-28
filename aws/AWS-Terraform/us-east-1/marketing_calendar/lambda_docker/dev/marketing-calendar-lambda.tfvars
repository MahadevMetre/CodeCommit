lambda_function_name = "marketing-calendar-lambda-dev"
role = "arn:aws:iam::116762271881:role/digital-lambda-docker-role-dev"
description = "marketing lambda for calendar story"
env_variables = {
		MARKETING_SECRET_NAME		=	"marketing-vanity-secrets-dev"
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
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-0860843b8e4c0cfdd"]
publish = false
image_uri = "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-calendar-lambda-dev" 