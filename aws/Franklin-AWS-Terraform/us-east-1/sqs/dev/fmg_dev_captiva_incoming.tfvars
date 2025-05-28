sqs_queue_name              = "captiva_incoming"
environment                 = "dev"
s3_pub_iam_consumer         = true

publisher_list               = [
    "arn:aws:s3:::captiva-landingzone-dev"
    ]
consumer_list                = [
    "arn:aws:iam::894891841990:user/CapLandZone-S3-Api-User-NonProd"
    ]

tags ={
    "ApplicationName" = "Lasso"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "LSO"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}