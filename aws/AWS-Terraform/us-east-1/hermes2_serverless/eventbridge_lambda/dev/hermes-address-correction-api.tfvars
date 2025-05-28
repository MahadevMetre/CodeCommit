hermes_address_correction_bool = true
lambda_function_name = "hermes-address-correction-api-dev"
role = "arn:aws:iam::116762271881:role/hermes-lambda-role-dev"
description = "Hermes Address Correction API Dev"
env_variables = {
	"ADDRESS_CORRECTION_URL"	= "https://dev-ecs.mtservices.franklinmadisonds.com/addressCorrection/updateAddressCorrection"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10302023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11022023"
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
handler = "hermes-address-correction-api.lambda_handler"
filename = "py/hermes-address-correction-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-address-correction-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-dev"
schedule_name = "hermes-address-correction-api-schedule-dev"
schedule_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"