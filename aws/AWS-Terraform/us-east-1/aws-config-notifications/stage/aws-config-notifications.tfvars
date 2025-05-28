project_name="aws-config-notifications"
env="stage"
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
		"CreatedOn": "04012023",
		"DataClassification": "Low",
		"Department": "DOS",
		"Infrastructure": "False",
		"LastUpdated": "06212023",
		"TechStack": "Python",
		"Usage": "Project",
		"Version": "1.0"
	}
lambda_env_variables = {
	"email_notifications"			=	"disabled"
	"email_notifications_blacklist"	=	"enabled"
	"email_receiver"				=	"FMG_CLOPS_Proj@franklin-madison.com"
	"email_sender"					=	"aws_config_alerts_stage@franklinmadisonds.com"
	"environment"					=	"Stage"
	"output_bucket_name"			=	"aws-config-notifications-702230634984-stage"
}
create_sns_topic = true