lambda_function_name = "lasso-manage-queue-qa"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Queue Management QA"
env_variables = {
		"CLOSE_CONNECTION_BUFFER"		=	"200"
		"DB_REGION_NAME"				=	"us-east-1"
		"LASSO_SECRET_NAME"				=	"lasso-secrets-stage"
		"LOG_LEVEL"						=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"	=	"lasso-rds-postgres-secret-qa"
		"POSTGRES_RDS_PROXY_END_POINT"	=	"lasso-postgres-rds-proxy-qa.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"				=	"lasso_qa"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "07142022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "03292023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0c1fcc73098539c26"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOQueueManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"