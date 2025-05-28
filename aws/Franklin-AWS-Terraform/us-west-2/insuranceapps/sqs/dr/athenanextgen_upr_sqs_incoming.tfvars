sqs_queue_name              = "athenanextgen_upr_dashboard_incoming"
environment                 = "dr"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/AthenaNextGen-SQS-User-DR"
   ]

root_arn = "arn:aws:iam::214946096060:root"

tags ={
    "ApplicationName" = "AthenaNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01102023"
	"DataClassification" = "Low"
	"Department" = "ANG"
	"Infrastructure" = "False"
	"LastUpdated" = "01102023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}