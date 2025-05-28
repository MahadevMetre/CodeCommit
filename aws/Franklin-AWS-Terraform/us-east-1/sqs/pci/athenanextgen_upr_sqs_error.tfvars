sqs_queue_name              = "athenanextgen_upr_dashboard_error"
environment                 = "prod"
receive_message             = true

consumer_list                = [
    "arn:aws:iam::894891841990:user/AthenaNextGen-SQS-User-Prod"
   ]

root_arn = "arn:aws:iam::601751840347:root"

tags ={
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "03112022"
    "DataClassification" = "Low"
    "Department" = "ANG"
    "Infrastructure" = "False"
    "LastUpdated" = "06222023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}