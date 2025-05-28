s3_bucket_arn_list=["arn:aws:s3:::franklin-stage-s3-access-logs"]

ses_access_policy = true
s3_pub_access_policy_bool=false
standard_pub_access_policy_bool=false
sns_topic_name="hermes_email_archive_topic_stage_test"
create_subscriptions_bool = true
source_owner = "702230634984"
subscriptions = {
    subscription_0 = ["sqs","arn:aws:sqs:us-east-1:702230634984:hermes_email_archive_sqs_incoming_stage"]
  }

tags ={
    "ApplicationName" = "Hermes"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "02022021"
    "DataClassification" = "Low"
    "Department" = "HMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}