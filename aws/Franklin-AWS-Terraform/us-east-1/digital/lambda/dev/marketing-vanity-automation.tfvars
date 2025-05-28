lambda_function_name = "marketing-vanity-automation-dev"
role = "arn:aws:iam::116762271881:role/_marketing_test_role"
description = "Lambda to parse the input excel from marketing-vanity-automation-dev bucket"
env_variables = {
		"AS400_DTA_SCHEMA"		=	"ART301DTA"
		"AS400_LIBRARIES"		=	"ART301DTA,ART301DTA2,ART301EXE,ART301WRK"
		"FROM_EXCEPTION_MAIL"	=	"vanity_exception_dev@franklinmadisonds.com"
		"LOG_LEVEL"				=	"DEBUG"
		"S3_REGION_NAME"		=	"us-east-1"
		"SECRET_NAME"			=	"marketing-vanity-secrets-dev"
		"TO_EXCEPTION_MAIL"		=	"vhd@franklin-madison.com"
		"VANITY_BUCKET_NAME"	=	"marketing-vanity-automation-dev"
	}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "04162024",
	"DataClassification": "None",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "04162024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 768
timeout = 300
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-037f5b5bb9a9bc966"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.marketing.vanity.web.MarketingVanityHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_marketing-vanity-automation-dev"
s3_bucket_account_id = "116762271881"
s3_bucket_arn = "arn:aws:s3:::marketing-vanity-automation-dev"