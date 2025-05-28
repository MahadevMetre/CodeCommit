project_name="aws-config-notifications"
env="pci"
lambda_desc = "Lambda to act upon aws config changes"
lambda_memory = 128
lambda_runtime ="python3.9"
lambda_timeout = 15
tags = {
        "ApplicationName": "DevOps",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "sbose",
		"CreatedOn": "03012023",
		"DataClassification": "Low",
		"Department": "DOS",
		"Infrastructure": "False",
		"LastUpdated": "06212023",
		"TechStack": "Python",
		"Usage": "Project",
		"Version": "1.0"
}
lambda_env_variables = {
	"email_notifications"			=	"enabled"
	"email_notifications_blacklist"	=	"enabled"
	"email_sender"					=	"aws_config_alerts_pci@franklinmadisonds.com"
	"email_receiver"				=	"insurance_alerts_aws@franklin-madison.com"
	"environment"					=	"PCI"
	"output_bucket_name"			=	"aws-config-notifications-601751840347-pci"
}
create_sns_topic = false