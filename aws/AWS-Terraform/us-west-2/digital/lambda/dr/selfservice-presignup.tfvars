lambda_function_name = "selfservice-pre-signup-dr"
role = "arn:aws:iam::214946096060:role/digital-lambda-role-dr"
description = "This is a presignup lambda trigger for cognito to validate the coverage and customer details from api."
env_variables = {
        "HOST" = "dr.mtservicesapps.fmservice.com"
        "LOGGER" = "DEBUG"
        "PORT" = "443"
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
memory_size = 512
timeout = 6
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0e65fd3db25a785e9","sg-00737bee850e3a634"]
reserved_concurrent_executions = -1
publish = false
runtime = "nodejs20.x"
handler = "selfservice-pre-signup.handler"
filename = "js/selfservice-pre-signup.zip"
package_type = "Zip"
source_code_hash = "js/selfservice-pre-signup.zip"