cluster_name				= "pycharm-webservices-qa"
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

create_iam_role				= false

cloudwatch_log_group_name	= "/ecs/pycharm-webservices-qa"
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

task_definition_family		= "pycharm-webservices-api-task-qa"
container_definition_name	= "pycharm-webservices-container"
container_definition_image	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-ws-qa"
cd_portmapping_containerport = 80
cd_portmapping_hostport = 80
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"ENVIRONMENT",
		"value"	=	"qa"
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
		"value"	=	"pycharm-serverless-qa"
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
td_execution_role_arn		= "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
td_task_role_arn			= "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
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

service_name				= "pycharm-webservices-api-service-qa"

service_subnets				= ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
service_sg					= ["sg-0577a75fbc20b0cfb"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/pycharm-webservices-tg-qa/dd657f0298781c42"