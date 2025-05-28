bucket_short_name = "customercommunications-email-test"
environment = "dev"
create_ins_bucket_policy = true
logging_bucket_name =  "franklin-dev-s3-access-logs"
logging_bucket_base_prefix = "ins/customercommunications-email-test-dev"
allowed_ins_users_iam_arn_list        = ["arn:aws:iam::116762271881:user/SES-Api-User-Dev"]
sqs_event_notification_arn            = "arn:aws:sqs:us-east-1:116762271881:s3_event_restore_incoming_dev"
events                                = ["s3:ObjectRestore:Completed"]
create_platformconfig_bucket_policy = true
s3_vpc_endpoint = ["vpce-00697e76c8bf46148"]
aws_referer = "116762271881"
create_customer_communication_policy = true

acl                 = "private" 
  
  lifecycle_tags						= {
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
 
  lifecycle_enabled_bool				= true
  lifecycle_transition_days				= "1"
  lifecycle_storage_class				= "GLACIER"
  versioning_enabled_bool				= false
  mfa_delete							= false
  lifecycle_id 							= "Glacier_transition"
    lifecycle_prefix						= ""
 
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
