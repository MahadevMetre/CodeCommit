lambda_function_name = "lasso-claims-tracker-qa"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Claims Tracker QA"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART303DTA"
		"AS400_DTA2_SCHEMA"						=	"ART303DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART302DTA,ART302DTA2,ART302EXE,ART302WRK"
		"AS400_WORK_SCHEMA"						=	"ART302WRK"
		"ATLAS_WS_MANAGE_CLAIM_EXTN_REPO_URL"	=   "https://stage-atlas-serverless-mt.franklinmadisonds.com/rest/DownloadImage/manageClaimsExtnRepo"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FASTRAX_EVENT_TYPE_URL"				=	"https://stage.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTrackingList"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-stage"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-qa"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-qa.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_qa"
		"PYCHARM_GLOBAL_PATH"					=	"/common/data/rml/lasso/repo/templates"
		"PYCHARM_TEMPLATE_OUTPUT_FILE_PATH"		=	"/tmp/lasso"
		"PYCHARM_TEMPLATE_OUTPUT_FILENAME"		=	"claim_tracker_electronic.pdf"
		"PYCHARM_TEMPLATE_PATH"					=	"/common/data/rml/lasso/repo/templates"
		"PYCHARM_TEMPLATE_RETURN_TYPE"			=	"BASE64"
		"PYCHARM_TEMPLATE_VERSION"				=	"1"
		"PYCHARM_URL"							=	"https://stage.mtservices.franklinmadisonds.com/pycharm/generatepdf"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "mfaizudeen",
	"CreatedOn": "03212023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06152023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 1024
ephemeral_storage_size = 1024
timeout = 29
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0c1fcc73098539c26"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOClaimsTrackerHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:702230634984:8b9xnegipe/*"