digital_serverless_bool = true
ce_name = "digital-customer-profile-delete-compute-env-pci"
ce_cr_max_vcpus = 2
ce_cr_sg_list = ["sg-0c24f21c2c6c2943b"]
ce_cr_subnet_list = ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::601751840347:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07302024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "digital-customer-profile-delete-job-queue-pci"

jd_name = "digital-customer-profile-delete-job-definition-pci"
jd_timeout = 600
jd_container_command = ["custprofdeleteJob"]
jd_container_image = "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:digital-batch-customer-profile-pci"
jd_container_exec_role_arn = "arn:aws:iam::601751840347:role/digital-ecs-task-execution-role-pci"
jd_container_job_role_arn = "arn:aws:iam::601751840347:role/digital-ecs-task-execution-role-pci"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_container_env_vars = [
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	},
	{
		"name"	=	"DATABASE_SCHEMA",
		"value"	=	"P"
	}
]
jd_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07302024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08282024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

schedule_group_name = "digital-serverless-scheduled-jobs-pci"
digital_schedule_env = "pci"
digital_customer_profile = true
schedule_target_role_arn = "arn:aws:iam::601751840347:role/digital-ecs-task-execution-role-pci"
schedule_job_name = "digital-customer-profile-delete-schedule-pci"