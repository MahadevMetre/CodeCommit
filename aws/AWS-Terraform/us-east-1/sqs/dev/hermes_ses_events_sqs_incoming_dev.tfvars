sqs_queue_name              = "hermes_ses_events_sqs_incoming_dev_test"
environment                 = "dev"
#s3_pub_iam_consumer         = true

publisher_list               = [
    "arn:aws:sns:us-east-1:116762271881:hermes_ses_events_topic_dev"
    ]
consumer_list                = [
    "arn:aws:iam::894891841990:user/Hermes-SQS-User-NonProd"
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