lambda_function_name = "marketing-default-delivery-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "marketing lambda for default-delivery"
env_variables = {
		"MARKETING_SECRET_NAME"		=	"marketing-vanity-secrets-qa",
		"spring_profiles_active"	=	"qa",
		"DB_SCHEMA"                 =   "303"

	}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06132024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "08172024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 30
subnets = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups = ["sg-0e0bde4366d2b3a7d"]
publish = false
image_uri = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-digital:marketing-default-delivery-qa"
attach_apigw_permission = true
apigw_arn = ["arn:aws:execute-api:us-east-1:634621569833:ek92om56yd/*/POST/marketing/defaultDelivery"]