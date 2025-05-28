hermes_kibana_count_api_bool = true
lambda_function_name = "hermes-kibana-count-api-stage"
role = "arn:aws:iam::702230634984:role/hermes-lambda-role-stage"
description = "Hermes Kibana Count API Stage"
env_variables = {
	"API_URL"	= "https://stage-ecs.mtservices.franklinmadisonds.com/batchProcessor/kibanaCount"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0b2cbcc29401d05ef"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-kibana-count-api.lambda_handler"
filename = "py/hermes-kibana-count-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-kibana-count-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-stage"
schedule_name = "hermes-kibana-count-api-schedule-stage"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"