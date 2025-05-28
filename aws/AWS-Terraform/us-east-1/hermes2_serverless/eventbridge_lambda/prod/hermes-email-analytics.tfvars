hermes_email_analytics_bool = true
lambda_function_name = "hermes-email-analytics-prod"
role = "arn:aws:iam::361469336240:role/hermes-lambda-role-prod"
description = "Hermes Email Analytics Prod"
env_variables = {
	"EMAIL_ANALYTICS_URL"			= "https://ecs.mtservices.franklinmadisonds.com/emailintegration/emailAnalytics"
}
tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11082023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
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
handler = "hermes-email-analytics.lambda_handler"
filename = "py/hermes-email-analytics.zip"
package_type = "Zip"
source_code_hash = "py/hermes-email-analytics.zip"

schedule_group_name = "hermes-serverless-scheduled-jobs-prod"
schedule_name = "hermes-email-analytics-schedule-prod"
schedule_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"

eb_rule_name = "hermes-email-analytics-rule-prod"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11082023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-prod"]
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
sqs_dlq_arn = "arn:aws:sqs:us-east-1:361469336240:hermes-serverless-dlq-prod"