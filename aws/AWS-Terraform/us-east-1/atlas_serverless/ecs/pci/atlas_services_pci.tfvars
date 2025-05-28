cluster_name				= "atlas-services-pci"
cluster_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "atlas-ecs-task-execution-role-pci"

iam_role_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/atlas-services-pci"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Atlas2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "atlas-services-task-pci"
container_definition_name	= "atlas-services-container"
container_definition_image	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:atlas-serverless-webservices-pci"
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
	"CreatedOn"				= "08302024"
	"DataClassification"	= "Low"
	"Department"			= "ATS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "atlas-service-pci"
service_subnets				= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg					= ["to-be-updated"]
service_tg_arn				= "to-be-updated"