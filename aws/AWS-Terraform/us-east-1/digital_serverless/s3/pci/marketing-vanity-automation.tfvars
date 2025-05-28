bucket_short_name			=	"marketing-vanity-automation"
environment					=	"pci"
logging_bucket_name			=	"franklin-pci-s3-access-logs"
logging_bucket_base_prefix	=	"marketing-vanity-automation-pci"
acl							=	"private"
tags ={
    "ApplicationName"		= "Marketing"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06262024"
	"CostCenter"			= "FMG"
	"DataClassification"	= "PCI"
	"Department"			= "MKT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06262024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

marketing_vanity_bucket_policy = true
marketing_vanity_allowed_users_list = ["arn:aws:iam::894891841990:user/Marketing-Vanity-CrushFTP-S3-User-Prod",
"arn:aws:iam::601751840347:user/fmservice_vanity_jenkins_user_pci"]

# Event Notification
bucket_notification_lambda_enabled = true
lambda_event_triggers = {
	"1" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:601751840347:function:marketing-vanity-automation-pci"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "marketing/upsell/incoming/"
		filter_suffix = ".xlsx"
		event_id = "Upsell vanity incoming excel lambda trigger"
	}
}