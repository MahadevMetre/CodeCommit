lambda_function_name = "lasso-authorizer-dev"
role = "arn:aws:iam::116762271881:role/lasso-lambda-role-dev"
description = "Lasso APIs JWT Authorizer Dev"
env_variables = {
		"AUTHORIZER_JWT_SECRET"				=	"lasso-secrets-dev"
		"DB_REGION_NAME"					=	"us-east-1"
		"ENVIRONMENT"                       =	"Dev"
		"LOG_LEVEL"							=	"DEBUG"
		"LSO_AUTHORIZER_JWT_SECRET"			=	"jwt_secret"
		"LSO_AUTHORIZER_JWT_TOKEN_EXPIRY"	=	"60"
	}
tags = {
	"ApplicationName": "Lasso",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "07132022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "03292023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.LSOJWTAuthorizer::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
snap_start_apply_on = "None"