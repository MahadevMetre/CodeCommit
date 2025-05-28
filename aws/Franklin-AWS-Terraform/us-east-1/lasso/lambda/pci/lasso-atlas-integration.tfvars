lambda_function_name = "lasso-atlas-integration-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso Atlas Integration PCI"
env_variables = {
		"AS400_DTA_SCHEMA"						=	"ARTPDTA"
		"AS400_DTA2_SCHEMA"						=	"ARTPDTA2"
		"AS400_END_POINT"						=	"prodsys7.franklin-madison.com"
		"AS400_LIBRARIES"						=	"ARTPDTA,ARTPDTA2,ARTPEXE,ARTPWRK"
		"AS400_WORK_SCHEMA"						=	"ARTPWRK"
		"CLOSE_CONNECTION_BUFFER"				=	"200"
		"DB_REGION_NAME"						=	"us-east-1"
		"FROM_EXCEPTION_MAIL"					=	"lasso_exception_prod@franklinmadisonds.com"
		"INSURANCECLAIMCABINET_BUCKETNAME"		=	"insuranceclaimscabinet-mr-pci"
		"INSURANCENONTERMCABINET_BUCKETNAME"	=	"insurancenontermcabinet-mr-pci"
		"INSURANCETERMCABINET_BUCKETNAME"		=	"insurancetermcabinet-mr-pci"
		"LASSO_SECRET_NAME"						=	"lasso-secrets-pci"
		"LOG_LEVEL"								=	"DEBUG"
		"POSTGRES_RDS_DB_SECRET_NAME"			=	"lasso-rds-postgres-secret-pci"
		"POSTGRES_RDS_PROXY_END_POINT"			=	"lasso-postgres-rds-proxy-pci.proxy-cs4anjfi9ucu.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"						=	"lasso_prod"
		"REGION_NAME"							=	"us-east-1"
		"S3_LASSO_BATCH_BUCKET_NAME"			=	"lasso-batch-files-pci"
		"S3_LASSO_BOCK_SERVER_BUCKET"			=	"insclaimsbockserver-pci"
		"S3_LASSO_SCANNED_BUCKET_NAME"			=	"lasso-scanned-files-pci"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "03012023",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "05302023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 2048
ephemeral_storage_size = 2048
timeout = 900
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0adbc06eff428aba4"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.LSOAtlasManagementHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
layers = ["arn:aws:lambda:us-east-1:601751840347:layer:PDFNet:1"]
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:601751840347:f5qh7hldi1/*"