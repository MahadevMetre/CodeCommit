lambda_function_name = "lasso-claims-tracker-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso Claims Tracker Dev"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART301DTA"
		"AS400_DTA2_SCHEMA"						=	"ART301DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART301DTA,ART301DTA2,ART301EXE,ART301WRK"
		"AS400_WORK_SCHEMA"						=	"ART301WRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"	=	"https://dev.mtservices.franklinmadisonds.com/atlasservices-ws/rest/DownloadImage/manageClaimsExtnRepo"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FASTRAX_EVENT_TYPE_URL"				=	"https://dev.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTrackingList"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-dev"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_dev"
		"PYCHARM_GLOBAL_PATH"					=	"/common/data/rml/lasso/repo/templates"
		"PYCHARM_TEMPLATE_OUTPUT_FILE_PATH"		=	"/tmp/lasso"
		"PYCHARM_TEMPLATE_OUTPUT_FILENAME"		=	"claim_tracker_electronic.pdf"
		"PYCHARM_TEMPLATE_PATH"					=	"/common/data/rml/lasso/repo/templates"
		"PYCHARM_TEMPLATE_RETURN_TYPE"			=	"BASE64"
		"PYCHARM_TEMPLATE_VERSION"				=	"1"
		"PYCHARM_URL"							=	"https://dev.mtservices.franklinmadisonds.com/pycharm/generatepdf"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "03112023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06152023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
ephemeral_storage_size = 512
timeout = 29
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOClaimsTrackerHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:116762271881:wc0z2q4bo3/*"