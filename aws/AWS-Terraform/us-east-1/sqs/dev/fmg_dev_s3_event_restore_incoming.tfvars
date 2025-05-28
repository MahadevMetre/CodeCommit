sqs_queue_name              = "s3_event_restore_incoming"
environment                 = "dev"
s3_pub_iam_consumer         = true
publisher_list               = [
    "arn:aws:s3:::insurancenontermcabinet-dev",
    "arn:aws:s3:::insurancetermcabinet-dev",
    "arn:aws:s3:::insuranceclaimscabinet-dev",
    "arn:aws:s3:::insurancehistoriccabinet-dev",
    "arn:aws:s3:::customercommunications-dev",
    "arn:aws:s3:::captiva-landingzone-dev"
    ]
consumer_list                = [
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