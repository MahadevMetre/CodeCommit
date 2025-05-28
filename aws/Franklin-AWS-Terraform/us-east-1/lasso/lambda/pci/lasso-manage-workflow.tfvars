lambda_function_name = "lasso-manage-workflow-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso Workflow Management PCI"
env_variables = {
		"CLOSE_CONNECTION_BUFFER"			=	"200"
		"DB_REGION_NAME"					=	"us-east-1"
		"LASSO_ATLAS_INTEGRATION_LAMBDA"	=	"lasso-atlas-integration-pci"
		"LOG_LEVEL"							=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"		=	"lasso-rds-postgres-secret-pci"
		"POSTGRES_RDS_PROXY_END_POINT"		=	"lasso-postgres-rds-proxy-pci.proxy-cs4anjfi9ucu.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"					=	"lasso_prod"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "08162022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "05042023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0adbc06eff428aba4"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOWorkflowManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"