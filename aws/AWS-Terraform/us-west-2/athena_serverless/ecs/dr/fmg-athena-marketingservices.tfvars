cluster_name				= "athena-marketingclient-webservices-dr"
cluster_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "athena-ecs-task-execution-role-dr"

iam_role_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/athena-marketingclient-webservices-dr"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name2	= "/ecs/athena_commondropdown-webservices-api-services-dr"
cloudwatch_log_group_retention2 = 400
cloudwatch_log_group_tags2 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name3	= "/ecs/athena_marketing-spokenkey-webservices-api-services-dr"
cloudwatch_log_group_retention3 = 400
cloudwatch_log_group_tags3 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name4	= "/ecs/athena_marketing-templates-webservices-api-service-dr"
cloudwatch_log_group_retention4 = 400
cloudwatch_log_group_tags4 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "athena_marketingclient-webservices-api-task-dr"
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
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "athena_marketingclient-webservices-api-service-dr"
service_subnets				= ["subnet-dr", "subnet-dr"]
service_sg					= ["update-sg-created-with-alb"]
service_tg_arn				= "update-tg-arn-fmg-athena-serverless-tg-dr"



task_definition_family2		= "athena_commondropdown-webservices-api-services-dr"
container_definition_name2	= "athena_commondropdown-webservices-container"
container_definition_image2	= "214946096060.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-common-dropdown-webservices-dr"
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
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name2				= "athena_commondropdown-webservices-api-service-dr"
service_subnets2			= ["subnet-dr", "subnet-dr"]
service_sg2					= ["sg-dr"]
service_tg_arn2				= "update-targetgroup-arn-ecs-athena-commonDropdown"


task_definition_family3		= "athena_marketing-spokenkey-webservices-api-services-dr"
container_definition_name3	= "athena_marketing-spokenkey-webservices-container"
container_definition_image3	= "214946096060.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-spokenkey-webservices-dr"
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
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name3				= "athena_marketing-spokenkey-webservices-api-service-dr"
service_subnets3			= ["subnet-dr", "subnet-dr"]
service_sg3					= ["sg-dr"]
service_tg_arn3				= "update-targetgroup-arn-ecs-athena-marketing-spokenkey"



task_definition_family4		= "athena_marketing-templates-webservices-api-service-dr"
container_definition_name4	= "athena_marketing-templates-webservices-container"
container_definition_image4	= "214946096060.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-spokenkey-webservices-dr"
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
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name4				= "athena_marketing-spokenkey-webservices-api-service-dr"
service_subnets4			= ["subnet-dr", "subnet-dr"]
service_sg4					= ["sg-dr"]
service_tg_arn4				= "update-targetgroup-arn-ecs-athena-marketing-templates"