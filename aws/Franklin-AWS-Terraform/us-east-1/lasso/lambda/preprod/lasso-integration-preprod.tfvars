lambda_function_name = "lasso-integration-preprod"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Integration PreProd"
env_variables = {
		"AS400_DTA_SCHEMA"								=	"ART303DTA"
		"AS400_DTA2_SCHEMA"								=	"ART303DTA2"
		"AS400_END_POINT"								=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"								=	"ART303DTA,ART303DTA2,ART303EXE,ART303WRK"
		"AS400_WORK_SCHEMA"								=	"ART303WRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"			=	"https://stage.mtservices.franklinmadisonds.com/atlasservices-ws/rest/DownloadImage/manageClaimsExtnRepo"
		"DB_REGION_NAME"								=	"us-east-1"
		"FROM_EXCEPTION_MAIL"							=	"lasso_exception_preprod@franklinmadisonds.com"
		"LASSO_SECRET_NAME"								=	"lasso-secrets-stage"
		"LOG_LEVEL"										=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"					=	"lasso-rds-postgres-secret-preprod"
		"POSTGRES_RDS_PROXY_END_POINT"					=	"lasso-postgres-rds-proxy-preprod.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"								=	"lasso_prod"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME"			=	"lasso-email-tracker-files-preprod"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_ERROR"		=	"_ERROR"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_PROCESSED"	=	"_PROCESSED"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_STAGE"		=	"_STAGE"
		"S3_LASSO_SCANNED_FILES_BUCKET_NAME"			=	"lasso-scanned-files-preprod/LASSO"
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
memory_size = 512
ephemeral_storage_size = 512
timeout = 900
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-088dc9f4c2b445256"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOIntegrationManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:702230634984:bkt78s2iq2/*"
lasso_integration_schedules = true
lasso_integration_schedule_env = "preprod"
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