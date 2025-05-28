hermes_regular_aggregator_bool = true
ce_name = "hermes-regular-aggregator-compute-env-qa"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0b2cbcc29401d05ef"]
ce_cr_subnet_list = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::702230634984:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07232023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-regular-aggregator-job-queue-qa"

jd_name = "hermes-regular-aggregator-job-definition-qa"
jd_timeout = 600
jd_container_command = ["regular_aggregatorJob"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-qa"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
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
	"CreatedOn"				= "08012023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

create_schedule_group = true
schedule_group_name = "hermes-serverless-scheduled-jobs-qa"
schedule_group_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08012023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_name = "hermes-regular-aggregator-schedule-qa"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
schedule_job_name = "Hermes-Regular-Aggregator-Job-QA"