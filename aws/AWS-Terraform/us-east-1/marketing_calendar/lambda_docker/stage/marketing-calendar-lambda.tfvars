lambda_function_name = "marketing-calendar-lambda-stage"
role = "arn:aws:iam::702230634984:role/digital-lambda-docker-role-stage"
description = "marketing lambda for calendar story"
env_variables = {
		MARKETING_SECRET_NAME		=	"marketing-vanity-secrets-stage"
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
subnets = ["subnet-076a071fa0723c80e","subnet-0ed61b6beb807094e"]
security_groups = ["sg-0fc189d57ec5f9016"]
publish = false
image_uri = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-calendar-lambda-stage"