sqs_queue_name              = "captiva_incoming_error_queue"
environment                 = "stage"
delete_sqs_message          = true
delete_sqs_msg_iam_arn_list = [
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