bucket_short_name = "insurancenontermcabinet-qa-mr"

bucket_arn = "arn:aws:s3:::insurancenontermcabinet-qa-mr"
# environment = "qa"
logging_bucket_name =  "franklin-alb-access-logs-qa"
logging_bucket_base_prefix = "ins/insurancenontermcabinet-qa-mr"
allowed_ins_users_iam_arn_list        = ["arn:aws:iam::634621569833:user/SES-Api-User-QA"]
sqs_event_notification_arn            = "arn:aws:sqs:us-east-1:634621569833:s3_event_restore_incoming"
events                                = ["s3:ObjectRestore:Completed"]

aws_referer = "634621569833"
insurancenontermcabinet_policy = true

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
        "LastUpdated": "09122024",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
