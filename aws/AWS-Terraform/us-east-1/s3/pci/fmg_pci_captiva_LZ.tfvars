bucket_short_name = "captiva-landingzone"
environment = "pci"
create_captiva_landing_zone_policy = true
logging_bucket_name =  "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "pci"
allowed_captiva_user_iam_arn_list = ["arn:aws:iam::894891841990:user/CapLandZone-S3-Api-User-PCI"]
allowed_ins_users_iam_arn_list = [
  "arn:aws:iam::894891841990:user/InsCabinetClaims-S3-Api-User-PCI",
  "arn:aws:iam::894891841990:user/InsCabinetHistoric-S3-Api-User-PCI",
  "arn:aws:iam::894891841990:user/InsCabinetTerm-S3-Api-User-PCI",
  "arn:aws:iam::894891841990:user/InsCabinetNonTerm-S3-Api-User-PCI"
]

create_sqs_s3_notification            = true
event_notification_arn                = "arn:aws:sqs:us-east-1:601751840347:captiva_incoming_pci"
events                                = ["s3:ObjectCreated:Put"]
filter_suffix                         = ".json"
s3_vpc_endpoint = ["vpce-0c7663b8ced4aff71"]
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