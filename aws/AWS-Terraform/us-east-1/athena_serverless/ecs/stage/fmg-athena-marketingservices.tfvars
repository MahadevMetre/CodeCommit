cluster_name				= "athena-marketingclient-webservices-stage"
cluster_tags = {
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
	"Monitor"				= "TRUE"
}

iam_role_name				= "athena-ecs-task-execution-role-stage"

iam_role_tags = {
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

cloudwatch_log_group_name	= "/ecs/athena-marketingclient-webservices-stage"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
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

cloudwatch_log_group_name2	= "/ecs/athena_commondropdown-webservices-api-services-stage"
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

cloudwatch_log_group_name3	= "/ecs/athena_marketing-spokenkey-webservices-api-services-stage"
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

cloudwatch_log_group_name4	= "/ecs/athena_marketing-templates-webservices-api-service-stage"
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

cloudwatch_log_group_name5	= "/ecs/athena_marketing-maintenance-webservices-api-service-stage"
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

task_definition_family		= "athena_marketingclient-webservices-api-task-stage"
container_definition_name	= "athena_marketingclient-webservices-container"
container_definition_image	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-clients-webservices-stage"
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
	"CreatedOn"				= "08022024"
	"DataClassification"	= "None"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08022024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "athena_marketingclient-webservices-api-service-stage"

service_subnets				= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg					= ["sg-007eef57c17447f70"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/fmg-athena-serverless-tg-stage/5684a3c1a7a0568e"



task_definition_family2		= "athena_commondropdown-webservices-api-services-stage"
container_definition_name2	= "athena_commondropdown-webservices-container"
container_definition_image2	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-commondropdowns-webservices-stage"
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

service_name2				= "athena_commondropdown-webservices-api-services-stage"

service_subnets2			= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg2					= ["sg-007eef57c17447f70"]
service_tg_arn2				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/ecs-athena-commonDropdown/1e5cbd6a0380da08"


task_definition_family3		= "athena_marketing-spokenkey-webservices-api-services-stage"
container_definition_name3	= "athena_marketing-spokenkey-webservices-container"
container_definition_image3	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-spokenkey-webservices-stage"
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

service_name3				= "athena_marketing-spokenkey-webservices-api-services-stage"

service_subnets3			= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg3					= ["sg-007eef57c17447f70"]
service_tg_arn3				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/ecs-athena-marketing-spokenkey/93bc9c02381e393d"



task_definition_family4		= "athena_marketing-templates-webservices-api-service-stage"
container_definition_name4	= "athena_marketing-templates-webservices-container"
container_definition_image4	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-templates-webservices-stage"
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

service_name4				= "athena_marketing-templates-webservices-api-services-stage"

service_subnets4			= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg4					= ["sg-007eef57c17447f70"]
service_tg_arn4				= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/ecs-athena-marketing-templates/289fc32301e6d2e3"


task_definition_family5		= "athena_marketing-maintenance-webservices-api-task-stage" 
container_definition_name5	= "athena_marketing-maintenance-webservices-container"
container_definition_image5	= "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:athena-marketing-maintenance-webservices-stage"
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

service_name5				= "athena_marketing-maintenance-webservices-api-service-stage"

service_subnets5			= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
service_sg5					= ["sg-007eef57c17447f70"]
service_tg_arn5			= "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/ecs-athena-marketing-maintenance/0d09d2da06dfabcb"
