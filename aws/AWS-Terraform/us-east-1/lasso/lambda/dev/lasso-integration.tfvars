lambda_function_name = "lasso-integration-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso Integration Dev"
env_variables = {
		"AS400_DTA_SCHEMA"								=	"ART301DTA"
		"AS400_DTA2_SCHEMA"								=	"ART301DTA2"
		"AS400_END_POINT"								=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"								=	"ART301DTA,ART301DTA2,ART301EXE,ART301WRK"
		"AS400_WORK_SCHEMA"								=	"ART301WRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"			=	"https://dev-atlas-serverless-mt.franklinmadisonds.com/rest/DownloadImage/manageClaimsExtnRepo"
		"CLOSE_CONNECTION_BUFFER"						=	"200"
		"DB_REGION_NAME"								=	"us-east-1"
		"FROM_EXCEPTION_MAIL"							=	"lasso_exception_dev@franklinmadisonds.com"
		"LASSO_SECRET_NAME"								=	"lasso-secrets-dev"
		"LOG_LEVEL"										=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"					=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"					=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"								=	"lasso_dev"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME"			=	"lasso-email-tracker-files-dev"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_ERROR"		=	"_ERROR"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_PROCESSED"	=	"_PROCESSED"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_STAGE"		=	"_STAGE"
		"S3_LASSO_SCANNED_FILES_BUCKET_NAME"			=	"lasso-scanned-files-dev/LASSO"
		"S3_REGION_NAME"								=	"us-east-1"
		"WORKFLOW_FRKCLM"								=	"FRKCLM"
		"WORKFLOW_FRKKIN"								=	"FRKKIN"
		"WORKFLOW_FRKTRM"								=	"FRKTRM"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "05122023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "10252023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
ephemeral_storage_size = 512
timeout = 900
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOIntegrationManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:116762271881:wc0z2q4bo3/*"
lasso_integration_schedules = true
lasso_integration_schedule_env = "dev"
schedule_group_tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "05182023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "10252023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}