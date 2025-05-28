hermes_process_email_act_kitcode_bool = true
ce_name = "hermes-process-email-act-kitcode-compute-env-qa"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0577a75fbc20b0cfb"]
ce_cr_subnet_list = ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::634621569833:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-process-email-act-kitcode-job-queue-qa"

jd_name = "hermes-process-email-act-kitcode-job-definition-qa"
jd_timeout = 600
jd_container_command = ["processActivatedEmailKitCodeRecordsJob"]
jd_container_image = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-qa"
jd_container_exec_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_container_env_vars = [
	{
		"name"	=	"DB_CONNECTION_POOL",
		"value"	=	"10"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
jd_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "hermes-serverless-scheduled-jobs-qa"

schedule_name = "hermes-process-email-act-kitcode-schedule-qa"
schedule_target_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
schedule_job_name = "Hermes-Process-Email-Act-Kitcode-Job-QA"