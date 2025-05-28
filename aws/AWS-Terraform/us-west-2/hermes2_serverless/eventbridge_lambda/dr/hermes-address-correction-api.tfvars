hermes_address_correction_bool = true
lambda_function_name = "hermes-address-correction-api-dr"
role = "arn:aws:iam::214946096060:role/hermes-lambda-role-dr"
description = "Hermes Address Correction API DR"
env_variables = {
	"ADDRESS_CORRECTION_URL"	= "https://dr-ecs.mtservices.franklinmadisonds.com/addressCorrection/updateAddressCorrection"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "Python"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
memory_size = 128
ephemeral_storage_size = 512
timeout = 10
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0a12c44f2b53a9dba"]
reserved_concurrent_executions = -1
publish = false
runtime = "python3.11"
handler = "hermes-address-correction-api.lambda_handler"
filename = "py/hermes-address-correction-api.zip"
package_type = "Zip"
source_code_hash = "py/hermes-address-correction-api.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-dr"
schedule_name = "hermes-address-correction-api-schedule-dr"
schedule_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"