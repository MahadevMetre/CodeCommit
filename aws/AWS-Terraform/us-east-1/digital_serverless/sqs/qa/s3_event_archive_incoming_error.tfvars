sqs_queue_name              = "s3_event_archive_incoming_error_queue"
environment                 = "qa"
delete_sqs_message          = true

delete_sqs_msg_iam_arn_list = [
        "arn:aws:iam::894891841990:user/S3-Event-SQS-User-PCI"
    ]
    
tags ={
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09142024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "09142024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}