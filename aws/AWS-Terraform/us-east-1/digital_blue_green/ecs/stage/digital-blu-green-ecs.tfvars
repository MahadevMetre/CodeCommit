cluster_name				= "digital-blu-green-stage"
cluster_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "0905024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "0905024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "digital-ecs-task-execution-blu-green-role-stage"

iam_role_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "0905024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "0905024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/digital-blu-green-stage"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "0905024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "0905024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "digital-blu-green-task-stage"
container_definition_name	= "digital-blu-green-task-stage"
container_definition_image	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:digital-web-services-stage"  
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
	"CreatedOn"				= "0905024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "0905024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "digital-blu-green-stage"

service_subnets				= ["subnet-076a071fa0723c80e", "subnet-0ed61b6beb807094e"]
service_sg					= ["sg-023805ffbb0c568cc"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/fmg-digital-blu-green-tg-stage/7f5a14f34559b084"


ecs_min_capacity            = 2
ecs_max_capacity            = 2
ecs_instance_warmup         = 60
ecs_scaling_target_value    = 75
ecs_scale_out_cooldown      = 60
ecs_scale_in_cooldown       = 60
ecs_scaling_policy_name     = "digital-ecs-blu-green-asg"
ecs_scaling_metric          = "ECSServiceAverageCPUUtilization"

asg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "0905024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "0905024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}