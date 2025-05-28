sqs_queue_name              = "gps_printpo_sqs_incoming"
environment                 = "dev"
receive_message             = true

publisher_list               = []
consumer_list                = [
    "arn:aws:iam::894891841990:user/GPS-SQS-User-NonProd"
   ]

tags ={
    "ApplicationName" = "GPSNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Graphics"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "GPS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}