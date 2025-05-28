lambda_function_name = "lasso-claims-tracker-induction-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso Claims Tracker Induction Dev"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART301DTA"
		"AS400_DTA2_SCHEMA"						=	"ART301DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART301DTA,ART301DTA2,ART301EXE,ART301WRK"
		"AS400_WORK_SCHEMA"						=	"ART301WRK"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FASTRAX_CLAIMS_BANNER_REPRINT_WS_URL"	=	"https://dev.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/reprintBanner"
		"FASTRAX_WS_EVENT_TYPE_URL" 			=	"https://dev.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTracking"
		"FASTRAX_WS_URL"						=	"https://dev.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/updateLassoStatus"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_dev@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-dev-mr"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-dev-mr"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-dev-mr"
		"LASSO_ATLAS_INTEGRATION_LAMBDA"		=	"lasso-atlas-integration-dev"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-dev"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_dev"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-dev"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-dev"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-dev"
		"S3_REGION_NAME"						=	"us-east-1"
		"WORKFLOW_FRKKIN"						=	"FRKKIN"
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
	"LastUpdated": "07162023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
ephemeral_storage_size = 512
timeout = 15
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOClaimsTrackerInductHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:116762271881:layer:PDFNet:2"]
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-claims-tracker-files-dev"
s3_bucket_account_id = "116762271881"
s3_bucket_arn = "arn:aws:s3:::lasso-claims-tracker-files-dev"