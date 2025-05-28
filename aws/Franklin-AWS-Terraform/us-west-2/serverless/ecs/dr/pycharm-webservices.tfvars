cluster_name				= "pycharm-webservices-dr"
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

create_iam_role				= false

cloudwatch_log_group_name	= "/ecs/pycharm-webservices-dr"
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

task_definition_family		= "pycharm-webservices-api-task-dr"
container_definition_name	= "pycharm-webservices-container"
container_definition_image	= "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:pycharm-ws-dr"
cd_portmapping_containerport = 80
cd_portmapping_hostport = 80
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"ENVIRONMENT",
		"value"	=	"dr"
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
		"value"	=	"pycharm-serverless-dr"
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
td_execution_role_arn		= "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
td_task_role_arn			= "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
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

service_name				= "pycharm-webservices-api-service-dr"

service_subnets				= ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
service_sg					= ["sg-0a12c44f2b53a9dba"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-west-2:214946096060:targetgroup/pycharm-webservices-tg-dr/3bf500c99e2ce3e3"