cluster_name				= "digital-services-pci"
cluster_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07312024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"Monitor"				= "TRUE"
}

iam_role_name				= "digital-ecs-task-execution-role-pci"

iam_role_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07312024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

cloudwatch_log_group_name	= "/ecs/digital-webservices-pci"
cloudwatch_log_group_retention = 400
cloudwatch_log_group_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07312024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

task_definition_family		= "digital-webservices-task-pci"
container_definition_name	= "digital-webservices-task-pci"
container_definition_image	= "601751840347.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:digital-web-services-pci"  
cd_portmapping_containerport = 8080
cd_portmapping_hostport = 8080
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name": "DIGITAL_DB_SCHEMA",
		"value": "P"
		
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu			= "2048"
task_definition_memory		= "7168"

td_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07312024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

service_name				= "digital-webservices-pci"

service_subnets				= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
service_sg					= ["sg-0c24f21c2c6c2943b"]
service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:601751840347:targetgroup/fmg-digital-serverless-tg-pci/8a29b27b6b9cb240"