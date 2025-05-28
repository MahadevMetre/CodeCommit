lambda_function_name = "batch-job-launcher-dr"
role = "arn:aws:iam::214946096060:role/batch-job-launcher-role-dr"
description = "Lambda to invoke jobs from Batch-Integration batch, triggered by eventbridge rules"
env_variables = {
		"HOST_URL"		=	"dr.mtservices.franklinmadisonds.com"
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
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0a06197a3564292a2"]
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