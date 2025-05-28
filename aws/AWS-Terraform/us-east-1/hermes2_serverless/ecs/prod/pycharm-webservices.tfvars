cluster_name				= "pycharm-webservices-prod"
cluster_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"Monitor"				= "TRUE"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

create_iam_role				= false

cloudwatch_log_group_name	= "/ecs/pycharm-webservices-prod"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "pycharm-webservices-api-task-prod"
container_definition_name	= "pycharm-webservices-container"
container_definition_image	= "361469336240.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-ws-prod"
cd_portmapping_containerport = 80
cd_portmapping_hostport = 80
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"ENVIRONMENT",
		"value"	=	"prod"
	},
	{
		"name"	=	"INSCHECK_OUTPUT_PDF_ROOT",
		"value"	=	"hermes2/outgoing/delivery/internal/checks"
	},
	{
		"name"	=	"LOG_FILE",
		"value"	=	"pycharm.log"
	},
	{
		"name"	=	"LOG_LOC",
		"value"	=	"/common/logs/pycharm/ws/{DYNAMIC_FOLDER_NAME}/system"
	},
	{
		"name"	=	"OUTPUT_PDF_BASE_PATH",
		"value"	=	"/home/pycharm/pycharm_out"
	},
	{
		"name"	=	"OUTPUT_PDF_ROOT",
		"value"	=	"hermes2/outgoing/delivery"
	},
	{
		"name"	=	"SAVE_JSON_FLAG",
		"value"	=	"True"
	},
	{
		"name"	=	"SAVE_JSON_LOC",
		"value"	=	"/common/logs/pycharm/ws/{DYNAMIC_FOLDER_NAME}/payloads"
	},
	{
		"name"	=	"S3_BUCKET_VALUE",
		"value"	=	"pycharm-serverless-prod"
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
td_execution_role_arn		= "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
td_task_role_arn			= "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
td_volumes = {
	"1" = {
		td_volume_name = "fmg-serverless-efs"
		td_volume_fs_id = "fs-0f1da5ae990ffab56"
		td_volume_root_dir = "/"
	}
}
td_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "pycharm-webservices-api-service-prod"

service_subnets				= ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
service_sg					= ["sg-03e2f86c64383bf88"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:361469336240:targetgroup/pycharm-webservices-tg-prod/0f2de7df59817cee"