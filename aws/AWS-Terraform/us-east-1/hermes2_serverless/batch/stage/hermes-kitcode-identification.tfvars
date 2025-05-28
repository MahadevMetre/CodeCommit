hermes_kitcode_identification_bool = true
ce_name = "hermes-kitcode-identification-compute-env-stage"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0b2cbcc29401d05ef"]
ce_cr_subnet_list = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::702230634984:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Marketing"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "04172024"
	"DataClassification"	= "None"
	"Department"			= "MKT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "04172024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-kitcode-identification-job-queue-stage"

jd_name = "hermes-kitcode-identification-job-definition-stage"
jd_timeout = 600
jd_container_command = ["kitcodeIdentificationJob"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-stage"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_container_env_vars = [
	{
		"name"	=	"DB_CONNECTION_POOL",
		"value"	=	"20"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
jd_tags = {
	"ApplicationName"		= "Marketing"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "04172024"
	"DataClassification"	= "None"
	"Department"			= "MKT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "04172024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "hermes-serverless-scheduled-jobs-stage"

schedule_name = "hermes-kitcode-identification-schedule-stage"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
schedule_job_name = "Hermes-Kitcode-Identification-Job-Stage"