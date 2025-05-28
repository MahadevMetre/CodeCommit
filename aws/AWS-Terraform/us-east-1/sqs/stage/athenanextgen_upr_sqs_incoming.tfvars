sqs_queue_name              = "athenanextgen_upr_dashboard_incoming"
environment                 = "stage"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/AthenaNextGen-SQS-User-NonProd"
   ]

root_arn = "arn:aws:iam::702230634984:root"

tags ={
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "ANG"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}