lambda_function_name = "fmg-app-function"
role = "arn:aws:iam::116762271881:role/marketing-vanity-lambda-role-dev"
description = "Lambda to parse the input excel from marketing-vanity-automation-dev bucket"
env_variables = {
		"Key"		=	"value"
}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06042024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "06042024",
	"TechStack": "Node",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 768
timeout = 300
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-037f5b5bb9a9bc966"]
reserved_concurrent_executions = -1
publish = false
runtime = "node18"
handler = "com.marketing.vanity.web.MarketingOauth"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"