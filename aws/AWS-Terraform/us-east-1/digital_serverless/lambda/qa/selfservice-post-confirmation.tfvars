lambda_function_name = "selfservice-post-confirmation-qa"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "This is a post confirmation lambda trigger for cognito"
env_variables = {
  "BLOB"               = "TO BE UPDATED"
  "LOGGER"             = "DEBUG"
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
timeout                        = 5
subnets                        = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups                = ["sg-0e0bde4366d2b3a7d"]
reserved_concurrent_executions = -1
publish                        = false
runtime                        = "nodejs20.x"
handler                        = "selfservice-post-confirmation.handler"
filename                       = "js/selfservice-post-confirmation-qa.zip"
package_type                   = "Zip"
source_code_hash               = "js/selfservice-post-confirmation-qa.zip"