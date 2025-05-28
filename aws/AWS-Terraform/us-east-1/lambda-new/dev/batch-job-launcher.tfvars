lambda_function_name = "batch-job-launcher-dev"
role = "arn:aws:iam::116762271881:role/batch-job-launcher-role-dev"
description = "Lambda to invoke jobs from Batch-Integration batch, triggered by eventbridge rules"
env_variables = {
		"HOST_URL"		=	"dev.mtservices.franklinmadisonds.com"
		"LOG_LEVEL"		=	"DEBUG"
	}
tags = {
	"ApplicationName": "Batch-Integration",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "Operations",
	"CreatedBy": "mfaizudeen",
	"CreatedOn": "03202023",
	"DataClassification": "Low",
	"Department": "Batch-Integration",
	"Infrastructure": "False",
	"LastUpdated": "05252023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
	}
memory_size = 512
timeout = 60
subnets = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_groups = ["sg-0536e2e6fb0df534c"]
reserved_concurrent_executions = -1
publish = false
runtime = "java8.al2"
handler = "com.ins.web.BatchJobLaunchHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"
batch_job_launcher_schedules = true
hermes_job_launcher_schedules = true
schedule_group_tags = {
	"ApplicationName": "Batch-Integration",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "Operations",
	"CreatedBy": "mfaizudeen",
	"CreatedOn": "03202023",
	"DataClassification": "Low",
	"Department": "Batch-Integration",
	"Infrastructure": "False",
	"LastUpdated": "05252023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}