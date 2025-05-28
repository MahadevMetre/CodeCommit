hermes_process_email_api_act_kitcode_bool = true
ce_name = "hermes-process-email-api-act-kitcode-compute-env-prod"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-03e2f86c64383bf88"]
ce_cr_subnet_list = ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::361469336240:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "12132023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12132023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-process-email-api-act-kitcode-job-queue-prod"

jd_name = "hermes-process-email-api-act-kitcode-job-definition-prod"
jd_timeout = 1200
jd_container_command = ["processAPIKitcodeActiveJob"]
jd_container_image = "361469336240.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-prod"
jd_container_exec_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
jd_container_job_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
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
	"CreatedOn"				= "12132023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12132023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "hermes-serverless-scheduled-jobs-prod"

schedule_name = "hermes-process-email-api-act-kitcode-schedule-prod"
schedule_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
schedule_job_name = "Hermes-Process-Email-API-Act-Kitcode-Job-Prod"