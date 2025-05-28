hermes_address_correction_bool = true
lambda_function_name = "hermes-address-correction-api-stage"
role = "arn:aws:iam::702230634984:role/hermes-lambda-role-stage"
description = "Hermes Address Correction API Stage"
env_variables = {
	"ADDRESS_CORRECTION_URL"	= "https://stage-ecs.mtservices.franklinmadisonds.com/addressCorrection/updateAddressCorrection"
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
subnets = ["subnet-0ed61b6beb807094e","subnet-076a071fa0723c80e"]
security_groups = ["sg-0b2cbcc29401d05ef"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-address-correction-api.lambda_handler"
filename = "py/hermes-address-correction-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-address-correction-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-stage"
schedule_name = "hermes-address-correction-api-schedule-stage"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"