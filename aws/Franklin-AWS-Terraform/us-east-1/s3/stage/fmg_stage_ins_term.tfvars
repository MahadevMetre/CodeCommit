bucket_short_name = "insurancetermcabinet"
environment = "stage"
create_ins_bucket_policy = true
logging_bucket_name =  "franklin-stage-s3-access-logs"
logging_bucket_base_prefix = "ins"
allowed_ins_users_iam_arn_list = ["arn:aws:iam::894891841990:user/InsCabinet-S3-Api-User-Stage"]

create_sqs_s3_notification            = true
event_notification_arn                = "arn:aws:sqs:us-east-1:702230634984:s3_event_restore_incoming_stage"
events                                = ["s3:ObjectRestore:Completed"]
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


