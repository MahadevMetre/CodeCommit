s3_bucket_arn_list=["arn:aws:s3:::franklin-dev-s3-access-logs"]

s3_pub_access_policy_bool=true
standard_pub_access_policy_bool=false
sns_topic_name="hermes_ses_events_topic_pci"
create_subscriptions_bool = true
subscriptions = {
    subscription_0 = ["sqs","arn:aws:sqs:us-east-1:601751840347:hermes_ses_events_sqs_incoming_pci"]
  }

tags ={
    "ApplicationName" = "Hermes"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "HMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}