hermes_payload_cleanup_api_bool = true
lambda_function_name = "hermes-payload-cleanup-api-qa"
role = "arn:aws:iam::702230634984:role/hermes-lambda-role-stage"
description = "Hermes Payload Cleanup API QA"
env_variables = {
	"API_URL"	= "https://qa-ecs.mtservices.franklinmadisonds.com/batchProcessor/removePayload"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0b2cbcc29401d05ef"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-payload-cleanup-api.lambda_handler"
filename = "py/hermes-payload-cleanup-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-payload-cleanup-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-qa"
schedule_name = "hermes-payload-cleanup-api-schedule-qa"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"