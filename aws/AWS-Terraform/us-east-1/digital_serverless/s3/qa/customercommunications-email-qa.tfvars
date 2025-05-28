bucket_short_name = "customercommunications-email"
environment = "qa"
create_ins_bucket_policy = false
logging_bucket_name =  "franklin-alb-access-logs-qa"
logging_bucket_base_prefix = "ins/customercommunications-email-qa"
allowed_ins_users_iam_arn_list        = ["arn:aws:iam::894891841990:user/aws-s3-api-user-qa"]
sqs_event_notification_arn            = "arn:aws:sqs:us-east-1:634621569833:s3_event_restore_incoming_qa"
events                                = ["s3:ObjectRestore:Completed"]
create_platformconfig_bucket_policy = false
s3_vpc_endpoint = ["vpc-00f27e42f4b836922"]
aws_referer = "634621569833"
# create_customer_communication_policy = true
enable_ses_bucket_policy = true
acl                 = "private" 
  
 
 
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
        "LastUpdated": "09152024",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
