lambda_function_name = "selfservice-custom-trigger-dr"
role = "arn:aws:iam::214946096060:role/digital-lambda-role-dr"
description = "This is a Custom trigger for cognito"
env_variables = {
        "CONTACT_US" = "https://dr.fmservice.com/contact"
		"HOST" = "dr.mtservicesapps.fmservice.com"
        "LOGGER" = "DEBUG"
        "LOGIN_URL" = "https://dr.fmservice.com/login"
		"PORT" = "443"
        "REGISTRATION_URL" = "https://dr.fmservice.com/register"
        "RESET_PASSWORD_URL" = "https://dr.fmservice.com/resetPassword"
    }
tags = {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03202023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "04222024"
	"TechStack" = "NodeJS"
	"Usage" = "Project"
	"Version" = "1.0"
        }
memory_size = 128
timeout = 5
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0e65fd3db25a785e9","sg-00737bee850e3a634"]
reserved_concurrent_executions = -1
publish = false
runtime = "nodejs20.x"
handler = "selfservice-custom-trigger.handler"
filename = "js/selfservice-custom-trigger.zip"
package_type = "Zip"
source_code_hash = "js/selfservice-custom-trigger.zip"