lambda_function_name = "lasso-integration-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso Integration PCI"
env_variables = {
		"AS400_DTA_SCHEMA"								=	"ARTPDTA"
		"AS400_DTA2_SCHEMA"								=	"ARTPDTA2"
		"AS400_END_POINT"								=	"prodsys7.franklin-madison.com"
		"AS400_LIBRARIES"								=	"ARTPDTA,ARTPDTA2,ARTPEXE,ARTPWRK"
		"AS400_WORK_SCHEMA"								=	"ARTPWRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"			=	"https://mtservices.franklinmadisonds.com/atlasservices-ws/rest/DownloadImage/manageClaimsExtnRepo"
		"CLOSE_CONNECTION_BUFFER"						=	"200"
		"DB_REGION_NAME"								=	"us-east-1"
		"FROM_EXCEPTION_MAIL"							=	"lasso_exception_prod@franklinmadisonds.com"
		"LASSO_SECRET_NAME"								=	"lasso-secrets-pci"
		"LOG_LEVEL"										=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"					=	"lasso-rds-postgres-secret-pci"
		"POSTGRES_RDS_PROXY_END_POINT"					=	"lasso-postgres-rds-proxy-pci.proxy-cs4anjfi9ucu.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"								=	"lasso_prod"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME"			=	"lasso-email-tracker-files-pci"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_ERROR"		=	"_ERROR"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_PROCESSED"	=	"_PROCESSED"
		"S3_LASSO_EMAIL_TRACKER_BUCKET_NAME_STAGE"		=	"_STAGE"
		"S3_LASSO_SCANNED_FILES_BUCKET_NAME"			=	"lasso-scanned-files-pci/LASSO"
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
	"CreatedOn": "06152023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06262024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 1024
ephemeral_storage_size = 1024
timeout = 900
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0adbc06eff428aba4"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOIntegrationManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:601751840347:f5qh7hldi1/*"
lasso_integration_schedules = true
lasso_integration_schedule_env = "pci"
schedule_group_tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "06152023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06152023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}