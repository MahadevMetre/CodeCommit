sqs_queue_name              = "hermes_email_archive_sqs_incoming_test"
environment                 = "stage"
sns_publisher_policy         = true

publisher_list               = [
    "arn:aws:sns:us-east-1:702230634984:hermes_email_archive_topic_stage"
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