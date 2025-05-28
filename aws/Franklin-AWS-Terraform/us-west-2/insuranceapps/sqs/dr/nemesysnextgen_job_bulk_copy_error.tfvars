sqs_queue_name              = "nemesysnextgen_job_bulk_copy_error"
environment                 = "dr"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/NemesysNextGen-SQS-User-Dr"
   ]

root_arn = "arn:aws:iam::214946096060:root"

tags ={
    "ApplicationName" = "NemesysNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "Graphics"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01102023"
	"DataClassification" = "Low"
	"Department" = "NMS"
	"Infrastructure" = "False"
	"LastUpdated" = "01102023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}