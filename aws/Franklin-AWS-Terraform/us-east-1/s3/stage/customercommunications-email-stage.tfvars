bucket_short_name = "customercommunications-email-test"

bucket_arn = "arn:aws:s3:::customercommunications-email-test-stage"
environment = "stage"
logging_bucket_name =  "franklin-stage-s3-access-logs"
logging_bucket_base_prefix = "ins/customercommunications-email-stage"
allowed_ins_users_iam_arn_list        = ["arn:aws:iam::702230634984:user/SES-Api-User-Stage"]
sqs_event_notification_arn            = "arn:aws:sqs:us-east-1:702230634984:s3_event_restore_incoming_stage"
events                                = ["s3:ObjectRestore:Completed"]

aws_referer = "702230634984"
create_customer_communication_policy = true

acl                 = "private" 
  
  lifecycle_id 							= "Glacier_transition"
  lifecycle_prefix						= "" 
  lifecycle_enabled_bool				= true
  lifecycle_transition_days				= "1"
  lifecycle_storage_class				= "GLACIER"
  versioning_enabled_bool				= false
  mfa_delete							= false
  
 
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
