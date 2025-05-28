hermes_email_analytics_bool = true
lambda_function_name = "hermes-email-analytics-qa"
role = "arn:aws:iam::634621569833:role/hermes-lambda-role-qa"
description = "Hermes Email Analytics qa"
env_variables = {
	"EMAIL_ANALYTICS_URL"			= "https://qa-ecs.mtservices.franklinmadisonds.com/emailintegration/emailAnalytics"
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
handler = "hermes-email-analytics.lambda_handler"
filename = "py/hermes-email-analytics.zip"
package_type = "Zip"
source_code_hash = "py/hermes-email-analytics.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-qa"
schedule_name = "hermes-email-analytics-schedule-qa"
schedule_target_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"

eb_rule_name = "hermes-email-analytics-rule-qa"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10222023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10222023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-qa"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:634621569833:hermes-serverless-dlq-qa"