bucket_short_name = "lasso-claims-tracker-files"
environment = "dr"
logging_bucket_name =  "franklin-dr-s3-access-logs"
logging_bucket_base_prefix = "lasso-claims-tracker-files-dr"
acl                 = "private"
tags ={
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "05302023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "05302023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}

# Event Notification
bucket_notification_lambda_enabled = true
lambda_event_triggers = {
	"1" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-west-2:214946096060:function:lasso-claims-tracker-induction-dr"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "incoming/"
		filter_suffix = ""
		event_id = "CLAIMS TRACKER INDUCTION TRIGGER"
	}
}
allow_ses_put_policy = true