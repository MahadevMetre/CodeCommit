bucket_short_name = "lasso-scanned-files"
environment = "dev"
logging_bucket_name =  "franklin-dev-s3-access-logs"
logging_bucket_base_prefix = "lasso-scanned-files-dev"
acl                 = "private"
tags ={
    "ApplicationName"		= "Lasso"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CreatedBy"				= "sbose"
	"CreatedOn"				= "07182022"
	"CostCenter"			= "FMG"
	"DataClassification"	= "Low"
	"Department"			= "LSO"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02082024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

# Event Notification
bucket_notification_lambda_enabled = true
lambda_event_triggers = {
	"1" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:116762271881:function:lasso-induct-batch-dev"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKKIN/"
		filter_suffix = ".done"
		event_id = "NON-TERM FILE INDUCTION TRIGGER"
	},
	"2" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:116762271881:function:lasso-induct-batch-dev"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKTRM/"
		filter_suffix = ".done"
		event_id = "TERM FILE INDUCTION TRIGGER"
	},
	"3" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:116762271881:function:lasso-induct-batch-claims-dev"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKCLM/"
		filter_suffix = ".done"
		event_id = "CLAIMS FILE INDUCTION TRIGGER"
	},
	"4" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:116762271881:function:lasso-scanned-ips-report-dev"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/IPS/"
		filter_suffix = ".CSV"
		event_id = "IPS REPORT EVENT TRIGGER"
	}
}
s3_enable_lifecycle_config = true
s3_lifecycle_days = 365