hermes_address_correction_bool = true
lambda_function_name = "hermes-address-correction-api-qa"
role = "arn:aws:iam::634621569833:role/hermes-lambda-role-qa"
description = "Hermes Address Correction API qa"
env_variables = {
	"ADDRESS_CORRECTION_URL"	= "https://qa-ecs.mtservices.franklinmadisonds.com/addressCorrection/updateAddressCorrection"
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
handler = "hermes-address-correction-api.lambda_handler"
filename = "py/hermes-address-correction-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-address-correction-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-qa"
schedule_name = "hermes-address-correction-api-schedule-qa"
schedule_target_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"