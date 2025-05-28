sqs_queue_name              = "gps_printpo_sqs_error"
environment                 = "dr"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/GPS-SQS-User-Dr"
   ]

root_arn = "arn:aws:iam::214946096060:root"

tags ={
    "ApplicationName" = "GPSNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "Graphics"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01102023"
	"DataClassification" = "Low"
	"Department" = "GPS"
	"Infrastructure" = "False"
	"LastUpdated" = "01102023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}