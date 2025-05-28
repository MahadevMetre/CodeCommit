lambda_function_name = "marketing-coverage-details-dev"
role = "arn:aws:iam::116762271881:role/digital-lambda-docker-role-dev"
description = "UPDATE_ME"
env_variables = {
		"KEY"		=	"VALUE"
	}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "04232024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "04232024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-0860843b8e4c0cfdd"]
reserved_concurrent_executions = -1
publish = false
runtime = "java17"
handler = "UPDATE_ME"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"