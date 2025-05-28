lambda_function_name = "lasso-atlas-integration-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso Atlas Integration Dev"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART301DTA"
		"AS400_DTA2_SCHEMA"						=	"ART301DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART301DTA2,ART301DTA,ART301EXE,ART301WRK"
		"AS400_WORK_SCHEMA"						=	"ART301WRK"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_dev@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-dev-mr"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-dev-mr"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-dev-mr"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-dev"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_dev"
		"REGION_NAME"							=	"us-east-1"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-dev"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-dev"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-dev"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "01312023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "07162023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 2048
ephemeral_storage_size = 512
timeout = 900
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOAtlasManagementHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:116762271881:layer:PDFNet:2"]
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:116762271881:wc0z2q4bo3/*"