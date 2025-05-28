lambda_function_name = "lasso-claims-tracker-induction-preprod"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Claims Tracker Induction PreProd"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART303DTA"
		"AS400_DTA2_SCHEMA"						=	"ART303DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART303DTA,ART303DTA2,ART303EXE,ART303WRK"
		"AS400_WORK_SCHEMA"						=	"ART303WRK"
		"DB_REGION_NAME"						=	"us-east-1"
		"FASTRAX_CLAIMS_BANNER_REPRINT_WS_URL"	=	"https://stage.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/reprintBanner"
		"FASTRAX_WS_EVENT_TYPE_URL" 			=	"https://stage.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTracking"
		"FASTRAX_WS_URL"						=	"https://stage.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/updateLassoStatus"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_preprod@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-stage-mr"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-stage-mr"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-stage-mr"
		"LASSO_ATLAS_INTEGRATION_LAMBDA"		=	"lasso-atlas-integration-preprod"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-stage"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-preprod"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-preprod.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_prod"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-preprod"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-preprod"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-preprod"
		"S3_REGION_NAME"						=	"us-east-1"
		"WORKFLOW_FRKKIN"						=	"FRKKIN"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "04202023",
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
timeout = 15
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-088dc9f4c2b445256"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOClaimsTrackerInductHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:702230634984:layer:PDFNet:1"]
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-claims-tracker-files-preprod"
s3_bucket_account_id = "702230634984"
s3_bucket_arn = "arn:aws:s3:::lasso-claims-tracker-files-preprod"