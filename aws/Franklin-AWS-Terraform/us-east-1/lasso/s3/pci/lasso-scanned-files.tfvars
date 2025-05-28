bucket_short_name = "lasso-scanned-files"
environment = "pci"
logging_bucket_name =  "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "lasso-scanned-files-pci"
acl                 = "private"
tags ={
    "ApplicationName"		= "Lasso"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CreatedBy"				= "mfaizudeen"
	"CreatedOn"				= "08112022"
	"CostCenter"			= "FMG"
	"DataClassification"	= "PCI"
	"Department"			= "LSO"
	"Infrastructure"		= "False"
	"LastUpdated"			= "01242024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

# Event Notification
bucket_notification_lambda_enabled = true
lambda_event_triggers = {
	"1" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:601751840347:function:lasso-induct-batch-pci"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKKIN/"
		filter_suffix = ".done"
		event_id = "NON-TERM FILE INDUCTION TRIGGER"
	},
	"2" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:601751840347:function:lasso-induct-batch-pci"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKTRM/"
		filter_suffix = ".done"
		event_id = "TERM FILE INDUCTION TRIGGER"
	},
	"3" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:601751840347:function:lasso-induct-batch-claims-pci"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/FRKCLM/"
		filter_suffix = ".done"
		event_id = "CLAIMS FILE INDUCTION TRIGGER"
	},
	"4" = {
		lambda_notification_function_arn = "arn:aws:lambda:us-east-1:601751840347:function:lasso-scanned-ips-report-pci"
		events = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Copy", "s3:ObjectCreated:CompleteMultipartUpload"]
		filter_prefix = "LASSO/IPS/"
		filter_suffix = ".CSV"
		event_id = "IPS REPORT EVENT TRIGGER"
	}
}
s3_enable_lifecycle_config = true
s3_lifecycle_days = 90
versioning_enabled_bool	= true