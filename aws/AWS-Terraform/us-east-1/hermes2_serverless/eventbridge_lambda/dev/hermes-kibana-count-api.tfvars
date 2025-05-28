hermes_kibana_count_api_bool = true
lambda_function_name = "hermes-kibana-count-api-dev"
role = "arn:aws:iam::116762271881:role/hermes-lambda-role-dev"
description = "Hermes Kibana Count API Dev"
env_variables = {
	"API_URL"	= "https://dev-ecs.mtservices.franklinmadisonds.com/batchProcessor/kibanaCount"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "12052023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12052023"
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
handler = "hermes-kibana-count-api.lambda_handler"
filename = "py/hermes-kibana-count-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-kibana-count-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-dev"
schedule_name = "hermes-kibana-count-api-schedule-dev"
schedule_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"