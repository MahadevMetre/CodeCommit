lambda_function_name = "lasso-manage-batch-dr"
role = "arn:aws:iam::214946096060:role/lasso-lambda-role-dr"
description = "Lasso Batch Management DR"
env_variables = {
        "AS400_DTA_SCHEMA"						=	"ARTPDTA"
		"AS400_DTA2_SCHEMA"						=	"ARTPDTA2"
		"AS400_END_POINT"						=	"prodcbu7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ARTPDTA,ARTPDTA2,ARTPEXE,ARTPWRK"
		"AS400_WORK_SCHEMA"						=	"ARTPWRK"
		"DB_REGION_NAME"						=	"us-west-2"
		"CLOSE_CONNECTION_BUFFER"			    =	"200"
		"FASTRAX_CLAIMS_BANNER_REPRINT_WS_URL"	=	"https://dr.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/reprintBanner"
		"FASTRAX_WS_EVENT_TYPE_URL" 			=	"https://dr.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTracking"
		"FASTRAX_WS_URL"						=	"https://dr.mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/updateLassoStatus"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-mr-dr"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-mr-dr" 
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-mr-dr"
		"LASSO_ATLAS_INTEGRATION_LAMBDA"		=	"lasso-atlas-integration-dr"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-dr"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-dr"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-dr.proxy-cmace33urilh.us-west-2.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_prod"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-dr"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-dr"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-dr"
		"S3_REGION_NAME"						=	"us-west-2"
		"WORKFLOW_FRKKIN"						=	"FRKKIN"
	}
tags = {
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02162023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "09182024"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
        }
memory_size = 1024
timeout = 29
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0c967e241c1fe533e"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOBatchManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"