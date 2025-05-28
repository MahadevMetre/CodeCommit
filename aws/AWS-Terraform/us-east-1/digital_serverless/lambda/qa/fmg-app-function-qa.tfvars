lambda_function_name = "fmg-app-function-qa"
role                 = "arn:aws:iam::634621569833:role/marketing-vanity-lambda-role-qa"
description          = "fmg-app-function lambda for OAuth2.0"
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
	"LastUpdated": "08082024",
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
filename = "js/fmg-app-function-qa.zip"
package_type = "Zip"
source_code_hash = "js/fmg-app-function-qa.zip"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:634621569833:ek92om56yd/*/POST/marketing/getToken"
