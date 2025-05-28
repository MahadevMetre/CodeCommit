hermes_poe_image_processor_bool = true
ce_name = "hermes-poe-image-processor-compute-env-dr"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0a12c44f2b53a9dba"]
ce_cr_subnet_list = ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::214946096060:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-poe-image-processor-job-queue-dr"

jd_name = "hermes-poe-image-processor-job-definition-dr"
jd_timeout = 900
jd_container_command = ["poeImageProcessor_job"]
jd_container_image = "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-dr"
jd_container_exec_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_job_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
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
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-0f35f9eb48d423837"
jd_container_volume_root_dir = "/"
jd_container_mountpoint_container_path = "/common"
jd_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "hermes-serverless-scheduled-jobs-dr"

schedule_name = "hermes-poe-image-processor-schedule-dr"
schedule_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
schedule_job_name = "Hermes-POE-Image-Processor-Job-DR"