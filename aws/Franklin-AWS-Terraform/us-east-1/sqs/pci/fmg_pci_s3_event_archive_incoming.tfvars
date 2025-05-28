sqs_queue_name              = "s3_event_archive_incoming"
environment                 = "pci"
standard_pub_iam_sub         = true

publisher_list               = [
    "arn:aws:iam::601751840347:role/franklin-pci-processS3ArchiveEvent-lambda-role"
    ]
consumer_list                = [
    "arn:aws:iam::894891841990:user/S3-Event-SQS-User-PCI"
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