hermes_address_correction_bool = true
lambda_function_name = "hermes-address-correction-api-prod"
role = "arn:aws:iam::361469336240:role/hermes-lambda-role-prod"
description = "Hermes Address Correction API Prod"
env_variables = {
	"ADDRESS_CORRECTION_URL"	= "https://ecs.mtservices.franklinmadisonds.com/addressCorrection/updateAddressCorrection"
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
handler = "hermes-address-correction-api.lambda_handler"
filename = "py/hermes-address-correction-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-address-correction-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-prod"
schedule_name = "hermes-address-correction-api-schedule-prod"
schedule_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"