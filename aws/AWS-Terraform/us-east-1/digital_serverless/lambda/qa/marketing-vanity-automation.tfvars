lambda_function_name = "marketing-vanity-automation-qa"
role = "arn:aws:iam::634621569833:role/marketing-vanity-lambda-role-qa"
description = "Lambda to parse the input excel from marketing-vanity-automation-qa bucket"
env_variables = {
		"AS400_DTA_SCHEMA"		=	"ART302DTA"
		"AS400_LIBRARIES"		=	"ART302DTA,ART302DTA2,ART302EXE,ART302WRK"
		"FROM_EXCEPTION_MAIL"	=	"vanity_exception_qa@franklinmadisonds.com"
		"LOG_LEVEL"				=	"DEBUG"
		"S3_REGION_NAME"		=	"us-east-1"
		"SECRET_NAME"			=	"marketing-vanity-secrets-qa"
		"TO_EXCEPTION_MAIL"		=	"vhd@franklin-madison.com"
		"VANITY_BUCKET_NAME"	=	"marketing-vanity-automation-qa"
	}
tags = {
    "ApplicationName": "Marketing",
    "Automated": "True",
    "BackupPlan": "None",
    "CostCenter": "FMG",
    "CreatedBy": "DevOps",
    "CreatedOn": "09142024",
    "DataClassification": "Low",
    "Department": "MKT",
    "Infrastructure": "False",
    "LastUpdated": "09142024",
    "TechStack": "Java",
    "Usage": "Project",
    "Version": "1.0"
}
memory_size = 768
timeout = 300
subnets = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups = ["sg-0e0bde4366d2b3a7d"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.marketing.vanity.web.MarketingVanityHandler"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
attach_s3_permission = true
s3_bucket_statement_id = "event_permissions_for_bucket_marketing-vanity-automation-qa"
s3_bucket_account_id = "702230634984"
s3_bucket_arn = "arn:aws:s3:::marketing-vanity-automation-qa"