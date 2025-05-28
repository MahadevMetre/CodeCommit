cluster_name				= "hermes-webservices-dev"
cluster_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08282023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08282023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

iam_role_name				= "hermes-ecs-task-execution-role-dev"

iam_role_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08282023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08282023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/hermes-webservices-dev"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08282023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08282023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "hermes-webservices-api-task-dev"
container_definition_name	= "hermes-webservices-container"
container_definition_image	= "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-web-services-dev"
cd_portmapping_containerport = 8080
cd_portmapping_hostport = 8080
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"CF_CORE_POOL_SIZE",
		"value"	=	"10"
	},
	{
		"name"	=	"CF_THROTTLE_LIMIT",
		"value"	=	"10"
	},
	{
		"name"	=	"CSLT_CORE_POOL_SIZE",
		"value"	=	"10"
	},
	{
		"name"	=	"CSLT_THROTTLE_LIMIT",
		"value"	=	"10"
	},
	{
		"name"	=	"CPKT_CORE_POOL_SIZE",
		"value"	=	"8"
	},
	{
		"name"	=	"CPKT_THROTTLE_LIMIT",
		"value"	=	"8"
	},
	{
		"name"	=	"DB_CONNECTION_POOL",
		"value"	=	"200"
	},
	{
		"name"	=	"ISG_CORE_POOL_SIZE",
		"value"	=	"10"
	},
	{
		"name"	=	"ISG_THROTTLE_LIMIT",
		"value"	=	"10"
	},
	{
		"name"	=	"ISGCONV_CHUNK_SIZE",
		"value"	=	"1"
	},
	{
		"name"	=	"ISGCONV_CORE_POOL_SIZE",
		"value"	=	"10"
	},
	{
		"name"	=	"ISGCONV_THROTTLE_LIMIT",
		"value"	=	"10"
	},
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	},
	{
		"name"	=	"SMTP_HOST",
		"value"	=	"email-smtp.us-east-1.amazonaws.com"
	},
	{
		"name"	=	"SMTP_PORT",
		"value"	=	"587"
	}
]
cd_mount_points = [
	{
		sourceVolume = "fmg-serverless-efs"
		containerPath = "/common"
		readOnly = false
	}
]
task_definition_cpu			= "2048"
task_definition_memory		= "7168"
td_volumes = {
	"1" = {
		td_volume_name = "fmg-serverless-efs"
		td_volume_fs_id = "fs-09bbdeba8e282df8d"
		td_volume_root_dir = "/"
	}
}
td_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10032023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10032023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "hermes-webservices-api-service-dev"

service_subnets				= ["subnet-06291ceaa523f684c", "subnet-0734d8f28467d319f"]
service_sg					= ["sg-03ec84b14631c5168"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:116762271881:targetgroup/fmg-serverless-tg-dev/5834b2d04e4b3084"