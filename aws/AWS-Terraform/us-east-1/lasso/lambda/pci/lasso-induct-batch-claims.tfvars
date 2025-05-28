lambda_function_name = "lasso-induct-batch-claims-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso Induct Batch Claims PCI"
env_variables = {
		"CLOSE_CONNECTION_BUFFER"		=	"200"
		"DB_REGION_NAME"				=	"us-east-1"
		"LASSO_SECRET_NAME"				=	"lasso-secrets-pci"
		"LOG_LEVEL"						=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"	=	"lasso-rds-postgres-secret-pci"
		"POSTGRES_RDS_PROXY_END_POINT"	=	"lasso-postgres-rds-proxy-pci.proxy-cs4anjfi9ucu.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"				=	"lasso_prod"
		"S3_ERROR_DIR"					=	"_ERROR"
		"S3_LASSO_BATCH_FILES"			=	"lasso-batch-files-pci"
		"S3_PROCESSED_DIR"				=	"_PROCESSED"
		"S3_REGION_NAME"				=	"us-east-1"
		"S3_STAGE_DIR"					=	"_STAGE"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "10292022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06262024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 2536
ephemeral_storage_size = 2048
timeout = 300
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0adbc06eff428aba4"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOBatchInductHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:601751840347:layer:PDFNet:1"]
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-scanned-files-pci"
s3_bucket_account_id = "601751840347"
s3_bucket_arn = "arn:aws:s3:::lasso-scanned-files-pci"