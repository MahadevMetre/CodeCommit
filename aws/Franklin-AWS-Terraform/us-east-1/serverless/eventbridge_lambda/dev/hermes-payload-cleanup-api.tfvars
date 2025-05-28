hermes_payload_cleanup_api_bool = true
lambda_function_name = "hermes-payload-cleanup-api-dev"
role = "arn:aws:iam::116762271881:role/hermes-lambda-role-dev"
description = "Hermes Payload Cleanup API Dev"
env_variables = {
	"API_URL"	= "https://dev-ecs.mtservices.franklinmadisonds.com/batchProcessor/removePayload"
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
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-03ec84b14631c5168"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-payload-cleanup-api.lambda_handler"
filename = "py/hermes-payload-cleanup-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-payload-cleanup-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-dev"
schedule_name = "hermes-payload-cleanup-api-schedule-dev"
schedule_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"