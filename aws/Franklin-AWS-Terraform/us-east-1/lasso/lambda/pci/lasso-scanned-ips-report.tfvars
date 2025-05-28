lambda_function_name = "lasso-scanned-ips-report-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso Scanned IPS Report PCI"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ARTPDTA"
		"AS400_DTA2_SCHEMA"						=	"ARTPDTA2"
		"AS400_END_POINT"						=	"prodsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ARTPDTA,ARTPDTA2,ARTPEXE,ARTPWRK"
		"AS400_WORK_SCHEMA"						=	"ARTPWRK"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FASTRAX_CLAIMS_BANNER_REPRINT_WS_URL"	=	"https://mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/reprintBanner"
		"FASTRAX_WS_EVENT_TYPE_URL" 			=	"https://mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/createJobTracking"
		"FASTRAX_WS_URL"						=	"https://mtservicesapps.franklinmadisonds.com/fastraxwebservices-ws/rest/vendor/claimstracking/updateLassoStatus"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_prod@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-mr-pci"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-mr-pci"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-mr-pci"
		"LASSO_ATLAS_INTEGRATION_LAMBDA"		=	"lasso-atlas-integration-pci"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-pci"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-pci"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-pci.proxy-cs4anjfi9ucu.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_prod"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-pci"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-pci"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-pci"
		"S3_REGION_NAME"						=	"us-east-1"
		"WORKFLOW_FRKKIN"						=	"FRKKIN"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "mfaizudeen",
	"CreatedOn": "01242024",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "01242024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 60
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0adbc06eff428aba4"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOReportManagementHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_lasso-scanned-files-pci"
s3_bucket_account_id = "601751840347"
s3_bucket_arn = "arn:aws:s3:::lasso-scanned-files-pci"