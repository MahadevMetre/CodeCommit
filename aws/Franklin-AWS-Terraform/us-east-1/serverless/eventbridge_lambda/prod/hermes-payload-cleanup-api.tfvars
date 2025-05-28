hermes_payload_cleanup_api_bool = true
lambda_function_name = "hermes-payload-cleanup-api-prod"
role = "arn:aws:iam::361469336240:role/hermes-lambda-role-prod"
description = "Hermes Payload Cleanup API Prod"
env_variables = {
	"API_URL"	= "https://ecs.mtservices.franklinmadisonds.com/batchProcessor/removePayload"
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
timeout = 10
subnets = ["subnet-0052ab706c1f947c9","subnet-011ed7a9e6d735228"]
security_groups = ["sg-03e2f86c64383bf88"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-payload-cleanup-api.lambda_handler"
filename = "py/hermes-payload-cleanup-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-payload-cleanup-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-prod"
schedule_name = "hermes-payload-cleanup-api-schedule-prod"
schedule_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"