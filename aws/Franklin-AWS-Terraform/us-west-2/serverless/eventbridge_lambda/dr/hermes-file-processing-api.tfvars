hermes_file_processing_api_bool = true
lambda_function_name = "hermes-file-processing-api-dr"
role = "arn:aws:iam::214946096060:role/hermes-lambda-role-dr"
description = "Hermes File Processing API DR"
env_variables = {
	"API_URL"					= "https://dr-ecs.mtservices.franklinmadisonds.com/fileintegration/processSingleRecord"
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
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 30
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0a12c44f2b53a9dba"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-file-processing-api.lambda_handler"
filename = "py/hermes-file-processing-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-file-processing-api.zip"

eb_rule_name = "hermes-file-processing-api-rule-dr"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"