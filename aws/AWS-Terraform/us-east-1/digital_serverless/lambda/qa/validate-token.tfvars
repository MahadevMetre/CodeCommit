lambda_function_name = "validate_token"
role = "arn:aws:iam::634621569833:role/digital-lambda-docker-role-qa"
description = "validate_token"
env_variables = {
		"Key"		=	"value"
}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06202024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "08152024",
	"TechStack": "Node",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size                    = 512
timeout                        = 3
reserved_concurrent_executions = -1
publish = false
runtime = "nodejs20.x"
handler = "index.handler"
filename = "js/validate_token.zip"
package_type = "Zip"
source_code_hash = "js/validate_token.zip"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:634621569833:ek92om56yd/authorizers/2mu6hj"
