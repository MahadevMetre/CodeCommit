hermes_archival_api_bool = true
lambda_function_name = "hermes-archival-api-dev"
role = "arn:aws:iam::116762271881:role/hermes-lambda-role-dev"
description = "Hermes Archival API Dev"
env_variables = {
	"ARCHIVAL_API_URL"		= "https://dev.mtservicesapps.franklinmadisonds.com/batchintegration-web/rest/archieveProcess"
	"EVENT_SOURCE"			= "aws.s3"
	"OBJECT_SUFFIX"			= ".json"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10222023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10222023"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 10
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-03ec84b14631c5168"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-archival-api.lambda_handler"
filename = "py/hermes-archival-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-archival-api.zip"

eb_rule_name = "hermes-archival-api-rule-dev"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10222023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10222023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-dev"]
		},
		object = {
			key = [
				{
					prefix = "archival_job/incoming/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
sqs_dlq_arn = "arn:aws:sqs:us-east-1:116762271881:hermes-serverless-dlq-dev"