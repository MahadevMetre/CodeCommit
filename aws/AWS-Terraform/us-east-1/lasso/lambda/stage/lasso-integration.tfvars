lambda_function_name = "lasso-integration-stage"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Integration Stage"
env_variables = {
		"AS400_DTA_SCHEMA"								=	"ART303DTA"
		"AS400_DTA2_SCHEMA"								=	"ART303DTA2"
		"AS400_END_POINT"								=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"								=	"ART303DTA,ART303DTA2,ART303EXE,ART303WRK"
		"AS400_WORK_SCHEMA"								=	"ART303WRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"			=	"https://stage-atlas-serverless-mt.franklinmadisonds.com/rest/DownloadImage/manageClaimsExtnRepo"
		"CLOSE_CONNECTION_BUFFER"						=	"200"
		"DB_REGION_NAME"								=	"us-east-1"
		"FROM_EXCEPTION_MAIL"							=	"lasso_exception_stage@franklinmadisonds.com"
		"LASSO_SECRET_NAME"								=	"lasso-secrets-stage"
		"LOG_LEVEL"										=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"					=	"lasso-rds-postgres-secret-stage"
		"POSTGRES_RDS_PROXY_END_POINT"					=	"lasso-postgres-rds-proxy-stage.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"								=	"lasso_stage"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME"			=	"lasso-email-tracker-files-stage"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_ERROR"		=	"_ERROR"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_PROCESSED"	=	"_PROCESSED"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_STAGE"		=	"_STAGE"
		"S3_LASSO_SCANNED_FILES_BUCKET_NAME"			=	"lasso-scanned-files-stage/LASSO"
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
	"CreatedOn": "05182023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "10252023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 1024
ephemeral_storage_size = 1024
timeout = 900
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-04c3dc75422e1d698"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOIntegrationManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:702230634984:iwnjg1u8d3/*"
lasso_integration_schedules = true
lasso_integration_schedule_env = "stage"
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