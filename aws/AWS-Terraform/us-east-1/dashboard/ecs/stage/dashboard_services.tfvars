cluster_name				= "dashboard-webservices-stage"
cluster_tags = {
	"ApplicationName"		= "Dashboard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06272024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06272024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "dashboard-ecs-task-execution-role-stage"

iam_role_tags = {
	"ApplicationName"		= "Dashboard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06272024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06272024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/dashboard-webservices-stage"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Dashboard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06272024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06272024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "dashboard-webservices-task-stage"
container_definition_name	= "dashboard-webservices-container"
container_definition_image	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:dashboard-webservices-stage"
cd_portmapping_containerport = 8080
cd_portmapping_hostport = 8080
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu			= "1024"
task_definition_memory		= "2048"

td_tags = {
	"ApplicationName"		= "dashboard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06272024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06272024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "dashboard-service-stage"
service_subnets				= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg					= ["sg-00413bb8fd2913f81"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/fmg-dashboard-tg-stage/06503ef4f7f133b6"