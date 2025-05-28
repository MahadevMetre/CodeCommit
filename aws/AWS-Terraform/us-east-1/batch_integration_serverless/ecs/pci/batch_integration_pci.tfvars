cluster_name				= "batch-integration-pci"
cluster_tags = {
	"ApplicationName"		= "BatchInt"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "PCI"
	"Department"			= "BIS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "batch-integration-ecs-task-execution-role-pci"

iam_role_tags = {
	"ApplicationName"		= "BatchInt"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "PCI"
	"Department"			= "BIS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/batch-integration-pci"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "BatchInt"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "PCI"
	"Department"			= "BIS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "batch-integration-task-pci"
container_definition_name	= "batch-integration-container"
container_definition_image	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:batch-integration-serverless-pci"
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
task_definition_cpu			= "4096"
task_definition_memory		= "8192"

td_tags = {
	"ApplicationName"		= "BatchInt"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08302024"
	"DataClassification"	= "PCI"
	"Department"			= "BIS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08302024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
