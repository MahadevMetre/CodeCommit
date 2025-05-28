lambda_function_name = "lasso-atlas-integration-qa"
role = "arn:aws:iam::702230634984:role/lasso-lambda-role-stage"
description = "Lasso Atlas Integration QA"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ART303DTA"
		"AS400_DTA2_SCHEMA"						=	"ART303DTA2"
		"AS400_END_POINT"						=	"devlsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ART302DTA,ART302DTA2,ART302EXE,ART302WRK"
		"AS400_WORK_SCHEMA"						=	"ART302WRK"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_qa@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-stage-mr"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-stage-mr"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-stage-mr"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-stage"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-qa"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-qa.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_qa"
		"REGION_NAME"							=	"us-east-1"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-qa"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-qa"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-qa"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "02062023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "07112023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 2048
ephemeral_storage_size = 512
timeout = 900
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0c1fcc73098539c26"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOAtlasManagementHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:702230634984:layer:PDFNet:1"]
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:702230634984:8b9xnegipe/*"