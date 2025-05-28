sqs_queue_name              = "s3_event_archive_incoming_error_queue"
environment                 = "dev"
delete_sqs_message          = true

delete_sqs_msg_iam_arn_list = [
        "arn:aws:iam::894891841990:user/S3-Event-SQS-User-NonProd"
    ]
    
tags ={
    "ApplicationName" = "Hermes"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "HMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}