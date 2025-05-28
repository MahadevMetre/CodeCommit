hermes_archival_api_bool = true
lambda_function_name = "hermes-archival-api-qa"
role = "arn:aws:iam::634621569833:role/hermes-lambda-role-qa"
description = "Hermes Archival API qa"
env_variables = {
	"ARCHIVAL_API_URL"		= "https://qa.mtservicesapps.franklinmadisonds.com/batchintegration-web/rest/archieveProcess"
	"EVENT_SOURCE"			= "aws.s3"
	"OBJECT_SUFFIX"			= ".json"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05132024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05132024"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 10
subnets = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
security_groups = ["sg-0577a75fbc20b0cfb"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-archival-api.lambda_handler"
filename = "py/hermes-archival-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-archival-api.zip"

eb_rule_name = "hermes-archival-api-rule-qa"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05132024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05132024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-qa"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:634621569833:hermes-serverless-dlq-qa"