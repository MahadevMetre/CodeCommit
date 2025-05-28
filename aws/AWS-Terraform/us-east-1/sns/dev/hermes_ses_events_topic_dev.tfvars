s3_bucket_arn_list=["arn:aws:s3:::franklin-dev-s3-access-logs"]

s3_pub_access_policy_bool = true
sns_topic_name="hermes_ses_events_topic_dev"
create_subscriptions_bool = true
subscriptions = {
    subscription_0 = ["ses","arn:aws:sns:us-east-1:116762271881:ccms_ses_poc_pcharan:44c93e2e-380b-45b9-9b1e-21ea24adbb03"]
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