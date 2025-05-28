bucket_short_name = "captiva-landingzone"
environment = "dev"
create_captiva_landing_zone_policy = true
logging_bucket_name =  "franklin-dev-s3-access-logs"
allowed_captiva_user_iam_arn_list     = ["arn:aws:iam::894891841990:user/CapLandZone-S3-Api-User-NonProd"]
allowed_ins_users_iam_arn_list        = ["arn:aws:iam::894891841990:user/InsCabinet-S3-Api-User-Dev"]

create_sqs_s3_notification                = true
sqs_event_notification_arn           = "arn:aws:sqs:us-east-1:116762271881:captiva_incoming_dev"
events                                = ["s3:ObjectCreated:Put"]
filter_suffix                         = ".json"
create_sns_s3_notification                = false

versioning   = [
    {
     enabled    = true
     mfa_delete = false
    }
  ]
 
tags ={
        "ApplicationName": "Atlas",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "Operations",
        "CreatedBy": "DevOps",
        "CreatedOn": "NoInfo",
        "DataClassification": "Low",
        "Department": "ATS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}


lifecycle_rule = [
    {
      enabled = true
      id = "lifecycle-rule-bucket-level-7d-delete"
      expiration = [
        {
          days = 7
        }
      ]
    }
]
