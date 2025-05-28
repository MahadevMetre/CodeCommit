hermes_file_processing_api_bool = true
lambda_function_name = "hermes-file-processing-api-stage"
role = "arn:aws:iam::702230634984:role/hermes-lambda-role-stage"
description = "Hermes File Processing API Stage"
env_variables = {
	"API_URL"					= "https://stage-ecs.mtservices.franklinmadisonds.com/fileintegration/processSingleRecord"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0b2cbcc29401d05ef"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-file-processing-api.lambda_handler"
filename = "py/hermes-file-processing-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-file-processing-api.zip"

eb_rule_name = "hermes-file-processing-api-rule-stage"
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
			name = ["hermes-file-integration-stage"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-stage"