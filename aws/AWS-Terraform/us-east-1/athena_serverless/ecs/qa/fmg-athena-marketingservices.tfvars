cluster_name				= "athena-marketingclient-webservices-qa"
cluster_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06202024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "athena-ecs-task-execution-role-qa"

iam_role_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06202024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/athena-marketingclient-webservices-qa"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06202024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name2	= "/ecs/athena_commondropdown-webservices-api-services-qa"
cloudwatch_log_group_retention2 = 30
cloudwatch_log_group_tags2 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name3	= "/ecs/athena_marketing-spokenkey-webservices-api-services-qa"
cloudwatch_log_group_retention3 = 30
cloudwatch_log_group_tags3 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name4	= "/ecs/athena_marketing-templates-webservices-api-service-qa"
cloudwatch_log_group_retention4 = 30
cloudwatch_log_group_tags4 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name5	= "/ecs/athena_marketing-maintenance-webservices-api-service-qa"
cloudwatch_log_group_retention5 = 30
cloudwatch_log_group_tags5 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09152024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09152024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "athena_marketingclient-webservices-api-task-qa"
container_definition_name	= "athena_marketingclient-webservices-container"
container_definition_image	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-clients-webservices-qa"
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
task_definition_memory		= "3072"

td_tags = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06202024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06242024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "athena_marketingclient-webservices-api-service-qa"

service_subnets				= ["subnet-0aeea9e95e8137ce8", "subnet-059a28296ee46f82f"]
service_sg					= ["sg-0f82c349f7f246f8c"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/fmg-athena-serverless-tg-qa/929951d8a8e8d148"



task_definition_family2		= "athena_commondropdown-webservices-api-services-qa"
container_definition_name2	= "athena_commondropdown-webservices-container"
container_definition_image2	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-common-dropdown-webservices-qa"
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
task_definition_cpu2			= "1024"
task_definition_memory2		= "3072"

td_tags2 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name2				= "athena_commondropdown-webservices-api-services-qa"

service_subnets2			= ["subnet-0aeea9e95e8137ce8", "subnet-059a28296ee46f82f"]
service_sg2					= ["sg-0f82c349f7f246f8c"]
service_tg_arn2				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/ecs-athena-commonDropdown/e260baae92f38e0d"


task_definition_family3		= "athena_marketing-spokenkey-webservices-api-services-qa"
container_definition_name3	= "athena_marketing-spokenkey-webservices-container"
container_definition_image3	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-spokenkey-webservices-qa"
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
task_definition_cpu3		= "1024"
task_definition_memory3		= "3072"

td_tags3 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name3				= "athena_marketing-spokenkey-webservices-api-services-qa"

service_subnets3			= ["subnet-0aeea9e95e8137ce8", "subnet-059a28296ee46f82f"]
service_sg3					= ["sg-0f82c349f7f246f8c"]
service_tg_arn3				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/ecs-athena-marketing-spokenkey/3722c9d195529199"



task_definition_family4		= "athena_marketing-templates-webservices-api-service-qa"
container_definition_name4	= "athena_marketing-templates-webservices-container"
container_definition_image4	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:marketing-templates-webservices-qa"
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
task_definition_cpu4		= "1024"
task_definition_memory4		= "3072"

td_tags4 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name4				= "athena_marketing-templates-webservices-api-services-qa"

service_subnets4			= ["subnet-0aeea9e95e8137ce8", "subnet-059a28296ee46f82f"]
service_sg4					= ["sg-0f82c349f7f246f8c"]
service_tg_arn4				= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/ecs-athena-marketing-templates/b426b46539347932"

task_definition_family5		= "athena_marketing-maintenance-webservices-api-task-qa" 
container_definition_name5	= "athena_marketing-maintenance-webservices-container"
container_definition_image5	= "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-maintenance-webservices-qa"
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
task_definition_cpu5		= "1024"
task_definition_memory5		= "3072"

td_tags5 = {
	"ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09132024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09132024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name5				= "athena_marketing-maintenance-webservices-api-service-qa"

service_subnets5			= ["subnet-0aeea9e95e8137ce8", "subnet-059a28296ee46f82f"]
service_sg5					= ["sg-0f82c349f7f246f8c"]
service_tg_arn5 			= "arn:aws:elasticloadbalancing:us-east-1:634621569833:targetgroup/ecs-athena-marketing-maintenance/a8a406f5141ca1a4"