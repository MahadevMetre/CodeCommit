lambda_function_name = "marketing-lambda-warm-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "marketing-lambda-warm-qa"
env_variables = {
  "REGION_NAME"                     = "us-east-1"
  "LOG_LEVEL"                       = "DEBUG"
  "MARKETING_LAMBDA_NAMES"          = "marketing-default-delivery-qa,marketing-coverage-details-qa,marketing-matchbackenroll-qa,marketing-coverage-upsell-qa,marketing-manage-eventspokenkeys-qa,marketing-validate-accesscode-qa,marketing-manage-spokenkey-qa,marketing-enroll-qa"
}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "08162024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "08162024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size                    = 512
timeout                        = 15
subnets                        = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups                = ["sg-0e0bde4366d2b3a7d"]
reserved_concurrent_executions = -1
publish                        = false
runtime                        = "java11"
handler                        = "com.ins.web.MarketingHandler::handleRequest"
filename                       = "jar/sample.jar"
package_type                   = "Zip"
source_code_hash               = "jar/sample.jar"