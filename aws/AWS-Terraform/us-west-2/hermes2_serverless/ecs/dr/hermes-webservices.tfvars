cluster_name				= "hermes-webservices-dr"
cluster_tags = {
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

iam_role_name				= "hermes-ecs-task-execution-role-dr"

iam_role_tags = {
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

cloudwatch_log_group_name	= "/ecs/hermes-webservices-dr"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
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

task_definition_family		= "hermes-webservices-api-task-dr"
container_definition_name	= "hermes-webservices-container"
container_definition_image	= "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:hermes-web-services-dr"
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
		"value"	=	"INFO"
	},
	{
		"name"	=	"SMTP_HOST",
		"value"	=	"email-smtp.us-west-2.amazonaws.com"
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
		td_volume_fs_id = "fs-0f35f9eb48d423837"
		td_volume_root_dir = "/"
	}
}
td_tags = {
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

service_name				= "hermes-webservices-api-service-dr"

service_subnets				= ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
service_sg					= ["sg-0a12c44f2b53a9dba"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-west-2:214946096060:targetgroup/fmg-serverless-tg-dr/370d264908670ba8"