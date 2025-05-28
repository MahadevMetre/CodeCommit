lambda_function_name = "marketing-vanity-automation-stage"
role = "arn:aws:iam::702230634984:role/_marketing_test_role"
description = "Lambda to parse the input excel from marketing-vanity-automation-stage bucket"
env_variables = {
		"AS400_DTA_SCHEMA"		=	"ART303DTA"
		"AS400_LIBRARIES"		=	"ART303DTA,ART303DTA2,ART303EXE,ART303WRK"
		"FROM_EXCEPTION_MAIL"	=	"vanity_exception_stage@franklinmadisonds.com"
		"LOG_LEVEL"				=	"DEBUG"
		"S3_REGION_NAME"		=	"us-east-1"
		"SECRET_NAME"			=	"marketing-vanity-secrets-stage"
		"TO_EXCEPTION_MAIL"		=	"vhd@franklin-madison.com"
		"VANITY_BUCKET_NAME"	=	"marketing-vanity-automation-stage"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0404a2805e92627ec"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.marketing.vanity.web.MarketingVanityHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_marketing-vanity-automation-stage"
s3_bucket_account_id = "702230634984"
s3_bucket_arn = "arn:aws:s3:::marketing-vanity-automation-stage"