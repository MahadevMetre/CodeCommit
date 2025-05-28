digital_serverless_bool = true
ce_name = "marketing-mb-enroll-compute-env-stage"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0b2cbcc29401d05ef"]
ce_cr_subnet_list = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::702230634984:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "marketing-mb-enroll-job-queue-stage"

jd_name = "marketing-mb-enroll-job-definition-stage"
jd_timeout = 300
jd_container_command = ["mbenrollemailJob"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing_mbenroll_job-stage"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/digital-ecs-task-execution-role-stage"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/digital-ecs-task-execution-role-stage"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_container_env_vars = [
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	},
	{
		"name"	=	"DATABASE_SCHEMA",
		"value"	=	"303"
	}
]
jd_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "digital-serverless-scheduled-jobs-stage"
marketing_mb_enroll = true
digital_schedule_env = "stage"
schedule_target_role_arn = "arn:aws:iam::702230634984:role/digital-ecs-task-execution-role-stage"
schedule_job_name = "marketing-mb-enroll-job-compute-env-stage"