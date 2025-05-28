s3_bucket_arn_list=["arn:aws:s3:::franklin-pci-s3-access-logs"]

ses_access_policy = true
s3_pub_access_policy_bool=false
standard_pub_access_policy_bool=false
sns_topic_name="hermes_email_archive_topic_pci"
create_subscriptions_bool = true
source_owner = "601751840347"
subscriptions = {
    subscription_0 = ["sqs","arn:aws:sqs:us-east-1:601751840347:hermes_email_archive_sqs_incoming_pci"]
  }

tags ={
    "ApplicationName" = "Hermes"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "03012021"
    "DataClassification" = "Low"
    "Department" = "HMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}