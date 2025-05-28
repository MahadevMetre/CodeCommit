cluster_name				= "dashboard-webservices-pci"
cluster_tags = {
	"ApplicationName"		= "DashBoard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "DSB"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "dashboard-ecs-task-execution-role-pci"

iam_role_tags = {
	"ApplicationName"		= "DashBoard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "DSB"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/dashboard-webservices-pci"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "DashBoard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "DSB"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "dashboard-webservices-task-pci"
container_definition_name	= "dashboard-webservices-container"
container_definition_image	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:dashboard-webservices-pci"
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
task_definition_cpu			= "2048"
task_definition_memory		= "7168"

td_tags = {
	"ApplicationName"		= "DashBoard"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "0925024"
	"DataClassification"	= "PCI"
	"Department"			= "DSB"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "dashboard-service-pci"
service_subnets				= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg					= ["update-sg-id-fmg-dashboard-sg-pci"]
service_tg_arn				= "update-arn-fmg-dashboard-tg-pci"