lambda_function_name = "lasso-integration-dr"
role = "arn:aws:iam::214946096060:role/lasso-lambda-role-dr"
description = "Lasso Integration DR"
env_variables = {
		"AS400_DTA_SCHEMA"								=	"ARTPDTA"
		"AS400_DTA2_SCHEMA"								=	"ARTPDTA2"
		"AS400_END_POINT"								=	"prodcbu7.franklin-madison.com"
		"AS400_LIBRARIES"								=	"ARTPDTA,ARTPDTA2,ARTPEXE,ARTPWRK"
		"AS400_WORK_SCHEMA"								=	"ARTPWRK"
		"DB_REGION_NAME"								=	"us-west-2"
		"FROM_EXCEPTION_MAIL"							=	"lasso_exception_dr@franklinmadisonds.com"
		"LASSO_SECRET_NAME"								=	"lasso-secrets-dr"
		"LOG_LEVEL"										=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			        =	"lasso-rds-postgres-secret-dr"
		"POSTGRES_RDS_PROXY_END_POINT"			        =	"lasso-postgres-rds-proxy-dr.proxy-cmace33urilh.us-west-2.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						        =	"lasso_prod"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME"			=	"lasso-email-tracker-files-dr"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_ERROR"		=	"_ERROR"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_PROCESSED"	=	"_PROCESSED"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_STAGE"		=	"_STAGE"
		"S3_LASSO_SCANNED_FILES_BUCKET_NAME"			=	"lasso-scanned-files-dr/LASSO"
		"S3_REGION_NAME"								=	"us-west-2"
		"WORKFLOW_FRKCLM"								=	"FRKCLM"
		"WORKFLOW_FRKKIN"								=	"FRKKIN"
		"WORKFLOW_FRKTRM"								=	"FRKTRM"
	}
tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "mfaizudeen",
		"CreatedOn": "06162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06162023",
		"TechStack": "Java",
		"Usage": "Project",
		"Version": "1.0"
		}
memory_size = 1024
ephemeral_storage_size = 1024
timeout = 900
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0c967e241c1fe533e"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOIntegrationManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-west-2:214946096060:rax1rh8azg/*"
lasso_integration_schedules = true
lasso_integration_schedule_env = "dr"
schedule_group_tags = {
	    "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "mfaizudeen",
		"CreatedOn": "06162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06162023",
		"TechStack": "Java",
		"Usage": "Project",
		"Version": "1.0"
}