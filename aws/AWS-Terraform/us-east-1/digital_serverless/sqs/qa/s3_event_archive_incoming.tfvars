sqs_queue_name              = "s3_event_archive_incoming"
environment                 = "qa"
standard_pub_iam_sub         = true

publisher_list               = [
    "arn:aws:iam::634621569833:role/franklin-qa-processS3ArchiveEvent-lambda-role"
    ]
consumer_list                = [
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