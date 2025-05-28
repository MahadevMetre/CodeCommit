cluster_name				= "digital-services-qa"
cluster_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08092024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "digital-ecs-task-execution-role-qa"

iam_role_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08092024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/digital-webservices-qa"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08092024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "digital-webservices-task-qa"
container_definition_name	= "digital-webservices-task-qa"
container_definition_image	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-digital:digital-web-services-qa"  
cd_portmapping_containerport = 8080
cd_portmapping_hostport = 8080
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name": "DIGITAL_DB_SCHEMA",
		"value": "303"
		
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu			= "2048"
task_definition_memory		= "7168"

td_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08092024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "digital-webservices-qa"

service_subnets				= ["subnet-059a28296ee46f82f","subnet-0aeea9e95e8137ce8"]
service_sg					= ["sg-03d729a63a650988f"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/fmg-digital-serverless-tg-qa/bfd7c2d649304a72"

ecs_min_capacity            = 2
ecs_max_capacity            = 2
ecs_instance_warmup         = 60
ecs_scaling_target_value    = 75
ecs_scale_out_cooldown      = 60
ecs_scale_in_cooldown       = 60
ecs_scaling_policy_name     = "digital-ecs-asg"
ecs_scaling_metric          = "ECSServiceAverageCPUUtilization"

asg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08262024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08262024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}