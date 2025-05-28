cluster_name				= "atlas-services-stage"
cluster_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "atlas-ecs-task-execution-role-stage"

iam_role_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/atlas-services-stage"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "atlas-services-task-stage"
container_definition_name	= "atlas-services-container"
container_definition_image	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:atlas-services-serverless-webservices-stage"
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
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07102024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "atlas-service-stage"
service_subnets				= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg					= ["sg-01e8fa2d9dab39a3d"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/fmg-atlas-serverless-tg-stage/e54927c964987f88"