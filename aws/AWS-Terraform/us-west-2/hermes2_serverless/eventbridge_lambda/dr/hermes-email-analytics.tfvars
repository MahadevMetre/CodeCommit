hermes_email_analytics_bool = true
lambda_function_name = "hermes-email-analytics-dr"
role = "arn:aws:iam::214946096060:role/hermes-lambda-role-dr"
description = "Hermes Email Analytics DR"
env_variables = {
	"EMAIL_ANALYTICS_URL"			= "https://dr-ecs.mtservices.franklinmadisonds.com/emailintegration/emailAnalytics"
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
handler = "hermes-email-analytics.lambda_handler"
filename = "py/hermes-email-analytics.zip"
package_type = "Zip"
source_code_hash = "py/hermes-email-analytics.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-dr"
schedule_name = "hermes-email-analytics-schedule-dr"
schedule_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"

eb_rule_name = "hermes-email-analytics-rule-dr"
eb_rule_tags = {
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
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-dr"]
		},
		object = {
			key = [
				{
					prefix = "analytics_retry/incoming/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"