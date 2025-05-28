cluster_name				= "hermes-webservices-qa"
cluster_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

iam_role_name				= "hermes-ecs-task-execution-role-qa"

iam_role_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/hermes-webservices-qa"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "hermes-webservices-api-task-qa"
container_definition_name	= "hermes-webservices-container"
container_definition_image	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-web-services-qa"
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
		sourceVolume = "EFS-Serverless-Apps"
		containerPath = "/common"
		readOnly = false
	}
]
task_definition_cpu			= "2048"
task_definition_memory		= "7168"
td_volumes = {
	"1" = {
		td_volume_name = "EFS-Serverless-Apps"
		td_volume_fs_id = "fs-01e02ee1a382b8175"
		td_volume_root_dir = "/"
	}
}
td_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "hermes-webservices-api-service-qa"

service_subnets				= ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
service_sg					= ["sg-0577a75fbc20b0cfb"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/fmg-serverless-tg-qa/0aee2b2d9e0183d0"