digital_serverless_bool = true
ce_name = "digital-account-update-notification-qa"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-03d729a63a650988f"]
ce_cr_subnet_list = ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::634621569833:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "qa"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08082024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "digital-account-update-notification-job-queue-qa"

jd_name = "digital-account-update-notification-job-definition-qa"
jd_timeout = 300
jd_container_command = ["accountupdatenotificationJob"]
jd_container_image = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:digital-batch-account-update-qa"  
jd_container_exec_role_arn = "arn:aws:iam::634621569833:role/digital-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::634621569833:role/digital-ecs-task-execution-role-qa"
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
	"DataClassification"	= "qa"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08082024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

create_schedule_group = true
schedule_group_name = "digital-serverless-scheduled-jobs-qa"
schedule_group_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "qa"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08082024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

digital_schedule_env = "qa"
digital_account_update = true
schedule_target_role_arn = "arn:aws:iam::634621569833:role/digital-ecs-task-execution-role-qa"
schedule_job_name = "digital-account-update-notification-job-definition-qa"