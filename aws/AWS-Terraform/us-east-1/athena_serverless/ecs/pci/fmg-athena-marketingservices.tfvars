cluster_name				= "athena-marketingclient-webservices-pci"
cluster_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07222024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "athena-ecs-task-execution-role-pci"

iam_role_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07222024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/athena-marketingclient-webservices-pci"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07222024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name2	= "/ecs/athena_commondropdown-webservices-api-services-pci"
cloudwatch_log_group_retention2 = 400
cloudwatch_log_group_tags2 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name3	= "/ecs/athena_marketing-spokenkey-webservices-api-services-pci"
cloudwatch_log_group_retention3 = 400
cloudwatch_log_group_tags3 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name4	= "/ecs/athena_marketing-templates-webservices-api-service-pci"
cloudwatch_log_group_retention4 = 400
cloudwatch_log_group_tags4 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name5	= "/ecs/athena_marketing-maintenance-webservices-api-service-pci"
cloudwatch_log_group_retention5 = 400
cloudwatch_log_group_tags5 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "athena_marketingclient-webservices-api-task-pci"
container_definition_name	= "athena_marketingclient-webservices-container"
container_definition_image	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-clients-webservices-pci"  
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
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07222024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "athena_marketingclient-webservices-api-service-pci"
service_subnets				= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg					= ["sg-07c9438e0ff77707f"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:601751840347:targetgroup/fmg-athena-serverless-tg-pci/92935f57e56ca0b8"



task_definition_family2		= "athena_commondropdown-webservices-api-services-pci"
container_definition_name2	= "athena_commondropdown-webservices-container"
container_definition_image2	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-common-dropdown-webservices-pci"
cd_portmapping_containerport2 = 8080
cd_portmapping_hostport2 = 8080
cd_portmapping_protocol2 = "tcp"
cd_env_vars2 = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu2		= "2048"
task_definition_memory2		= "7168"

td_tags2 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name2				= "athena_commondropdown-webservices-api-service-pci"
service_subnets2			= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg2					= ["sg-07c9438e0ff77707f"]
service_tg_arn2				= "update-targetgroup-arn-ecs-athena-commonDropdown"


task_definition_family3		= "athena_marketing-spokenkey-webservices-api-services-pci"
container_definition_name3	= "athena_marketing-spokenkey-webservices-container"
container_definition_image3	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-spokenkey-webservices-pci"
cd_portmapping_containerport3 = 8080
cd_portmapping_hostport3 = 8080
cd_portmapping_protocol3 = "tcp"
cd_env_vars3 = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu3		= "2048"
task_definition_memory3		= "7168"

td_tags3 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name3				= "athena_marketing-spokenkey-webservices-api-service-pci"
service_subnets3			= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg3					= ["sg-07c9438e0ff77707f"]
service_tg_arn3				= "update-targetgroup-arn-ecs-athena-marketing-spokenkey"



task_definition_family4		= "athena_marketing-templates-webservices-api-service-pci"
container_definition_name4	= "athena_marketing-templates-webservices-container"
container_definition_image4	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-templates-webservices-pci"
cd_portmapping_containerport4 = 8080
cd_portmapping_hostport4 = 8080
cd_portmapping_protocol4 = "tcp"
cd_env_vars4 = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu4		= "2048"
task_definition_memory4		= "7168"

td_tags4 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name4				= "athena_marketing-templates-webservices-api-service-pci"
service_subnets4			= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg4					= ["sg-07c9438e0ff77707f"]
service_tg_arn4				= "update-targetgroup-arn-ecs-athena-marketing-templates"


task_definition_family5		= "athena_marketing-maintenance-webservices-api-task-pci" 
container_definition_name5	= "athena_marketing-maintenance-webservices-container"
container_definition_image5	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-maintenance-webservices-pci"
cd_portmapping_containerport5 = 8080
cd_portmapping_hostport5 = 8080
cd_portmapping_protocol5 = "tcp"
cd_env_vars5 = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu5		= "2048"
task_definition_memory5		= "7168"

td_tags5 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09252024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09252024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name5				= "athena_marketing-maintenance-webservices-api-service-pci"

service_subnets5			= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg5					= ["sg-07c9438e0ff77707f"]
service_tg_arn5			= "update-targetgroup-arn-ecs-athena-marketing-maintenance"
