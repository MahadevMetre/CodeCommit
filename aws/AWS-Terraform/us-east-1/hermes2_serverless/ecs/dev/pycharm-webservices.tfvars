cluster_name				= "pycharm-webservices-dev"
cluster_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09162023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09162023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

create_iam_role				= false

cloudwatch_log_group_name	= "/ecs/pycharm-webservices-dev"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09162023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09162023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "pycharm-webservices-api-task-dev"
container_definition_name	= "pycharm-webservices-container"
container_definition_image	= "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-ws-dev"
cd_portmapping_containerport = 80
cd_portmapping_hostport = 80
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"ENVIRONMENT",
		"value"	=	"dev"
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
		"value"	=	"pycharm-serverless-dev"
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
td_execution_role_arn		= "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
td_task_role_arn			= "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
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
	"CreatedOn"				= "10082023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "pycharm-webservices-api-service-dev"

service_subnets				= ["subnet-06291ceaa523f684c", "subnet-0734d8f28467d319f"]
service_sg					= ["sg-03ec84b14631c5168"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:116762271881:targetgroup/pycharm-webservices-tg-dev/0dc1f7c0ecb230ff"