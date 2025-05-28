lambda_function_name = "ec2-start-stop-dev"
role = "arn:aws:iam::116762271881:role/ec2-start-stop-role-dev"
description = "Lambda to transition instance state over weekend"
env_variables = {
		"LOG_LEVEL"		=	"INFO"
		"NOTIFY_EMAIL"	=	"FMG_CLOPS_Proj@franklin-madison.com"
	}
tags = {
	"ApplicationName": "DevOps",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "01212023",
	"DataClassification": "Low",
	"Department": "DOS",
	"Infrastructure": "False",
	"LastUpdated": "02092023",
	"TechStack": "Python",
	"Usage": "Project",
	"Version": "1.0"
	}
memory_size = 128
timeout = 15
runtime = "python3.9"
handler = "lambda_function.lambda_handler"
filename = "py/ec2-start-stop.zip"
package_type = "Zip"
source_code_hash = "py/ec2-start-stop.zip"
ec2_start_stop_schedules = true
schedule_group_tags = {
	"ApplicationName": "AWS",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "sbose",
	"CreatedOn": "02102023",
	"DataClassification": "Low",
	"Department": "DOS",
	"Infrastructure": "False",
	"LastUpdated": "02102023",
	"TechStack": "Python",
	"Usage": "Project",
	"Version": "1.0"
}