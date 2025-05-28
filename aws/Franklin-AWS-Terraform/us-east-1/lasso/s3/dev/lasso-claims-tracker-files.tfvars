bucket_short_name = "lasso-claims-tracker-files"
environment = "dev"
logging_bucket_name =  "franklin-dev-s3-access-logs"
logging_bucket_base_prefix = "lasso-claims-tracker-files-dev"
acl                 = "private"
tags ={
    "ApplicationName"		= "Lasso"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CreatedBy"				= "sbose"
	"CreatedOn"				= "03112023"
	"CostCenter"			= "FMG"
	"DataClassification"	= "None"
	"Department"			= "LSO"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06262023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

# Event Notification
bucket_notification_lambda_enabled = true
lambda_event_triggers = {
	"1" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:116762271881:function:lasso-claims-tracker-induction-dev"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "incoming/"
		filter_suffix = ""
		event_id = "CLAIMS TRACKER INDUCTION TRIGGER"
	}
}
allow_ses_put_policy = true