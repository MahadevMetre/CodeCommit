lambda_function_name = "selfservice-custom-trigger-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "This is a Custom trigger for cognito"
env_variables = {
  "CONTACT_US"         = "https://qa-selfservice.fmservice.com/contact"
  "HOST"               = "qa.mtservicesapps.fmservice.com"
  "LOGGER"             = "DEBUG"
  "LOGIN_URL"          = "https://stage-selfservice.fmservice.com/login"
  "PORT"               = "9993"
  "REGISTRATION_URL"   = "https://qa-selfservice.fmservice.com/register"
  "RESET_PASSWORD_URL" = "https://qa-selfservice.fmservice.com/resetPassword"
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
memory_size                    = 128
timeout                        = 60
subnets                        = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups                = ["sg-0e0bde4366d2b3a7d"]
reserved_concurrent_executions = -1
publish                        = false
runtime                        = "nodejs20.x"
handler                        = "selfservice-custom-trigger.handler"
filename                       = "js/selfservice-custom-trigger-qa.zip"
package_type                   = "Zip"
source_code_hash               = "js/selfservice-custom-trigger-qa.zip"