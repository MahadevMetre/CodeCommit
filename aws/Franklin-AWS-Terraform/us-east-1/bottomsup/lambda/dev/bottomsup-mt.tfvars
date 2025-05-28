lambda_function_name = "bottomsup-mt-dev"
role = "arn:aws:iam::116762271881:role/bottomsup-lambda-role-dev"
description = "BottomsUp MT Dev"
env_variables = {
		"JWT_TOKEN_EXPIRY"					=	"15"
		"JWT_TOKEN_SECRET_NAME"				=	"lasso-secrets-dev"
		"LOG_LEVEL"							=	"INFO"
		"POSTGRES_RDS_DB_SECRET_NAME"		=	"lasso-rds-postgres-secret-dev"
		"POSTGRES_RDS_PROXY_END_POINT"		=	"lasso-postgres-rds-proxy-dev.proxy-crsdewuox0qj.us-east-1.rds.amazonaws.com/postgres"
		"POSTGRES_SCHEMA"					=	"bottoms_up_dev"
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
        "LastUpdated": "NoInfo",
        "TechStack": "Java",
        "Usage": "Project",
        "Version": "1.0"

        }
memory_size = 512
timeout = 29
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-06ae6d0c600368f25"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.BottomsUpStreamLambdaHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
snap_start_apply_on = "PublishedVersions"
attach_apigw_permission = true
apigw_arn = "arn:aws:execute-api:us-east-1:116762271881:t85670dyg3/*"