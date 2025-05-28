hermes_archival_api_bool = true
lambda_function_name = "hermes-archival-api-prod"
role = "arn:aws:iam::361469336240:role/hermes-lambda-role-prod"
description = "Hermes Archival API Prod"
env_variables = {
	"ARCHIVAL_API_URL"		= "https://mtservicesapps.franklinmadisonds.com/batchintegration-web/rest/archieveProcess"
	"EVENT_SOURCE"			= "aws.s3"
	"OBJECT_SUFFIX"			= ".json"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 10
subnets = ["subnet-0052ab706c1f947c9","subnet-011ed7a9e6d735228"]
security_groups = ["sg-03e2f86c64383bf88"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-archival-api.lambda_handler"
filename = "py/hermes-archival-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-archival-api.zip"

eb_rule_name = "hermes-archival-api-rule-prod"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-prod"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:361469336240:hermes-serverless-dlq-prod"