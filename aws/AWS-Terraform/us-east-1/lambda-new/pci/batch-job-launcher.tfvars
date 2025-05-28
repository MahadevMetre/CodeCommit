lambda_function_name = "batch-job-launcher-pci"
role = "arn:aws:iam::601751840347:role/batch-job-launcher-role-pci"
description = "Lambda to invoke jobs from Batch-Integration batch, triggered by eventbridge rules"
env_variables = {
		"HOST_URL"		=	"mtservices.franklinmadisonds.com"
		"LOG_LEVEL"		=	"DEBUG"
	}
tags = {
	"ApplicationName": "Batch-Integration",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "Operations",
	"CreatedBy": "mfaizudeen",
	"CreatedOn": "05242023",
	"DataClassification": "Low",
	"Department": "Batch-Integration",
	"Infrastructure": "False",
	"LastUpdated": "07052023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
	}
memory_size = 512
timeout = 60
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0aae4dc2845a1df4a"]
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
	"CreatedOn": "05242023",
	"DataClassification": "Low",
	"Department": "Batch-Integration",
	"Infrastructure": "False",
	"LastUpdated": "07052023",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}