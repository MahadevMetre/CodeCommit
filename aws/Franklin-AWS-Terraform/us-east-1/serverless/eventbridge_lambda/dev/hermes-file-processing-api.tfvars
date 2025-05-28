hermes_file_processing_api_bool = true
lambda_function_name = "hermes-file-processing-api-dev"
role = "arn:aws:iam::116762271881:role/hermes-lambda-role-dev"
description = "Hermes File Processing API Dev"
env_variables = {
	"API_URL"					= "https://dev-ecs.mtservices.franklinmadisonds.com/fileintegration/processSingleRecord"
	"MAX_DELAY"					= "15"
	"MIN_DELAY"					= "5"
	"VALID_FILE_EXTENTIONS"		= ".pgp,.PGP,.txt,.TXT,.xml,.XML"
	"VALID_FILE_PATHS"			= "incoming/cpkt_api/,incoming/cslt_api/,incoming/isg_api/,incoming/isgconv_api/,incoming/pdn_api/"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "12132023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12132023"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 30
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-03ec84b14631c5168"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-file-processing-api.lambda_handler"
filename = "py/hermes-file-processing-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-file-processing-api.zip"

eb_rule_name = "hermes-file-processing-api-rule-dev"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "12132023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12132023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dev"]
		},
		object = {
			key = [
				{
					wildcard = "incoming/*_api/*_API.*"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
sqs_dlq_arn = "arn:aws:sqs:us-east-1:116762271881:hermes-serverless-dlq-dev"