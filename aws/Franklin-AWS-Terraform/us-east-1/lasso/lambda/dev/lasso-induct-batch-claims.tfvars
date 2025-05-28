lambda_function_name = "lasso-induct-batch-claims-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso Induct Batch Claims Dev"
env_variables = {
		"CLOSE_CONNECTION_BUFFER"		=	"200"
		"DB_REGION_NAME"				=	"us-east-1"
		"LASSO_SECRET_NAME"				=	"lasso-secrets-dev"
		"LOG_LEVEL"						=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"	=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"	=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"				=	"lasso_dev"
		"S3_ERROR_DIR"					=	"_ERROR"
		"S3_LASSO_BATCH_FILES"			=	"lasso-batch-files-dev"
		"S3_PROCESSED_DIR"				=	"_PROCESSED"
		"S3_REGION_NAME"				=	"us-east-1"
		"S3_STAGE_DIR"					=	"_STAGE"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "10142022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "03292023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
ephemeral_storage_size = 512
timeout = 300
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOBatchInductHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:116762271881:layer:PDFNet:2"]
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-scanned-files-dev"
s3_bucket_account_id = "116762271881"
s3_bucket_arn = "arn:aws:s3:::lasso-scanned-files-dev"