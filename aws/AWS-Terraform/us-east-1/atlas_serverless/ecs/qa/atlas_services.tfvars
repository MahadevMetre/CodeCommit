cluster_name				= "atlas-services-qa"
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

iam_role_name				= "atlas-ecs-task-execution-role-qa"

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

cloudwatch_log_group_name	= "/ecs/atlas-services-qa"
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

task_definition_family		= "atlas-services-task-qa"
container_definition_name	= "atlas-services-container"
container_definition_image	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:"
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

service_name				= "atlas-service-qa"
service_subnets				= ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
service_sg					= ["sg-0433a346e4cede0c6"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/fmg-atlas-serverless-tg-qa/84de3ba4eee23267"