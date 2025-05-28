hermes_poe_image_processor_bool = true
ce_name = "hermes-poe-image-processor-compute-env-dev"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-03ec84b14631c5168"]
ce_cr_subnet_list = ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::116762271881:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
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
	"LastUpdated"			= "09072023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-poe-image-processor-job-queue-dev"

jd_name = "hermes-poe-image-processor-job-definition-dev"
jd_timeout = 900
jd_container_command = ["poeImageProcessor_job"]
jd_container_image = "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-dev"
jd_container_exec_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_job_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_vcpu = "1.0"
jd_container_memory = "2048"
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
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-09bbdeba8e282df8d"
jd_container_volume_root_dir = "/"
jd_container_mountpoint_container_path = "/common"
jd_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10042023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10042023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "hermes-serverless-scheduled-jobs-dev"

schedule_name = "hermes-poe-image-processor-schedule-dev"
schedule_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
schedule_job_name = "Hermes-POE-Image-Processor-Job-Dev"