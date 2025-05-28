s3_bucket_arn_list=["arn:aws:s3:::franklin-stage-s3-access-logs"]

s3_pub_access_policy_bool=true
sns_topic_name="processS3ArchiveEvent_sns_stage"
create_subscriptions_bool = true
subscriptions = {
    subscription_0 = ["lambda","arn:aws:lambda:us-east-1:702230634984:function:processS3ArchiveEvent-lambda-stage"]
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