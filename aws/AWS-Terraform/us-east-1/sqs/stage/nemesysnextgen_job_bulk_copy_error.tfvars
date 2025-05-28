sqs_queue_name              = "nemesysnextgen_job_bulk_copy_error"
environment                 = "stage"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/NemesysNextGen-SQS-User-NonProd"
   ]

root_arn = "arn:aws:iam::702230634984:root"

tags ={
    "ApplicationName" = "NemesysNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "NMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}