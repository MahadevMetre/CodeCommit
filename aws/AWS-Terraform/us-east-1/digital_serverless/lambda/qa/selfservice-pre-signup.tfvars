lambda_function_name = "selfservice-pre-signup-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "This is a presignup lambda trigger for cognito to validate the coverage and customer details from api."
env_variables = {
  "HOST"               = "qa.mtservicesapps.fmservice.com"
  "LOGGER"             = "DEBUG"
  "PORT"               = "9993"
}
tags = {
	"ApplicationName": "Digital",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "08142024",
	"DataClassification": "None",
	"Department": "DGT",
	"Infrastructure": "False",
	"LastUpdated": "08142024",
	"TechStack": "NodeJS",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size                    = 512
timeout                        = 6
subnets                        = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups                = ["sg-0e0bde4366d2b3a7d"]
reserved_concurrent_executions = -1
publish                        = false
runtime                        = "nodejs20.x"
handler                        = "selfservice-pre-signup.handler"
filename                       = "js/selfservice-pre-signup-qa.zip"
package_type                   = "Zip"
source_code_hash               = "js/selfservice-pre-signup-qa.zip"