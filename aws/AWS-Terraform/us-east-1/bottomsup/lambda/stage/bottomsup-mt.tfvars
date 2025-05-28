lambda_function_name = "bottomsup-mt-stage"
role = "arn:aws:iam::702230634984:role/bottomsup-lambda-role-stage"
description = "BottomsUp MT Stage"
env_variables = {
		"JWT_TOKEN_EXPIRY"					=	"15"
		"JWT_TOKEN_SECRET_NAME"				=	"lasso-secrets-stage"
		"LOG_LEVEL"							=	"INFO"
		"POSTGRES_RDS_DB_SECRET_NAME"		=	"lasso-rds-postgres-secret-stage"
		"POSTGRES_RDS_PROXY_END_POINT"		=	"lasso-postgres-rds-proxy-stage.proxy-catwxniuzvrl.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"					=	"bottoms_up_stage"
	}
tags = {
        "ApplicationName": "Bottomsup",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "sbose",
        "CreatedOn": "01242023",
        "DataClassification": "Low",
        "Department": "Bottomsup",
        "Infrastructure": "False",
        "LastUpdated": "01312023",
        "TechStack": "Java",
        "Usage": "Project",
        "Version": "1.0"
       }
memory_size = 512
timeout = 29
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-04c3dc75422e1d698"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.BottomsUpStreamLambdaHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
snap_start_apply_on = "PublishedVersions"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:702230634984:s387xpfpo3/*"