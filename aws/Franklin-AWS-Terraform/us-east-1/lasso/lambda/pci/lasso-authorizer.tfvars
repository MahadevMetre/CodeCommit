lambda_function_name = "lasso-authorizer-pci"
role = "arn:aws:iam::601751840347:role/lasso-lambda-role-pci"
description = "Lasso APIs JWT Authorizer PCI"
env_variables = {
		"AUTHORIZER_JWT_SECRET"				=	"lasso-secrets-pci"
		"DB_REGION_NAME"					=	"us-east-1"
		"ENVIRONMENT"                       =	"Pci"
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
	"CreatedOn": "10102022",
	"DataClassification": "Low",
	"Department": "LSO",
	"Infrastructure": "False",
	"LastUpdated": "06152023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
reserved_concurrent_executions = -1
publish = true
runtime = "java11"
handler = "com.ins.LSOJWTAuthorizer::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
snap_start_apply_on = "PublishedVersions"