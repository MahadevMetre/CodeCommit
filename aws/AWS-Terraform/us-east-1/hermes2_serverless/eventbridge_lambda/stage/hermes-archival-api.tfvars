hermes_archival_api_bool = true
lambda_function_name = "hermes-archival-api-stage"
role = "arn:aws:iam::702230634984:role/hermes-lambda-role-stage"
description = "Hermes Archival API Stage"
env_variables = {
	"ARCHIVAL_API_URL"		= "https://stage.mtservicesapps.franklinmadisonds.com/batchintegration-web/rest/archieveProcess"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0b2cbcc29401d05ef"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-archival-api.lambda_handler"
filename = "py/hermes-archival-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-archival-api.zip"

eb_rule_name = "hermes-archival-api-rule-stage"
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
			name = ["hermes-batch-processor-stage"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-stage"