s3_bucket_arn_list=["arn:aws:s3:::franklin-pci-s3-access-logs","arn:aws:s3:::franklin-prod-s3-access-logs"]

s3_pub_access_policy_bool=true
standard_pub_access_policy_bool=false
sns_topic_name="processS3ArchiveEvent_sns_pci"
create_subscriptions_bool = true
subscriptions = {
    subscription_0 = ["lambda","arn:aws:lambda:us-east-1:601751840347:function:processS3ArchiveEvent-lambda-pci"]
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