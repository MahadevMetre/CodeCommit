bucket_short_name = "captiva-landingzone"
environment = "stage"
create_captiva_landing_zone_policy = true
logging_bucket_name =  "franklin-stage-s3-access-logs"
logging_bucket_base_prefix = "ins"
allowed_captiva_user_iam_arn_list = ["arn:aws:iam::894891841990:user/CapLandZone-S3-Api-User-NonProd"]
allowed_ins_users_iam_arn_list = ["arn:aws:iam::894891841990:user/InsCabinet-S3-Api-User-Stage"]

create_sqs_s3_notification                = true
event_notification_arn                = "arn:aws:sqs:us-east-1:702230634984:captiva_incoming_stage"
events                                = ["s3:ObjectCreated:Put"]
filter_suffix                         = ".json"
s3_vpc_endpoint = ["vpce-00697e76c8bf46148"]
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