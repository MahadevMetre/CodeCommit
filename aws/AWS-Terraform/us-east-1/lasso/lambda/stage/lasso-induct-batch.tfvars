lambda_function_name = "lasso-induct-batch-stage"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Induct Batch Stage"
env_variables = {
		"CLOSE_CONNECTION_BUFFER"		=	"200"
		"DB_REGION_NAME"				=	"us-east-1"
		"LASSO_SECRET_NAME"				=	"lasso-secrets-stage"
		"LOG_LEVEL"						=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"	=	"lasso-rds-postgres-secret-stage"
		"POSTGRES_RDS_PROXY_END_POINT"	=	"lasso-postgres-rds-proxy-stage.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"				=	"lasso_stage"
		"S3_ERROR_DIR"					=	"_ERROR"
		"S3_LASSO_BATCH_FILES"			=	"lasso-batch-files-stage"
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
	"CreatedOn": "07182022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "03292023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 1024
timeout = 300
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-04c3dc75422e1d698"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOBatchInductHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:702230634984:layer:PDFNet:1"]
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-scanned-files-stage"
s3_bucket_account_id = "702230634984"
s3_bucket_arn = "arn:aws:s3:::lasso-scanned-files-stage"