file_name  = "E:/aws drift script/branches/Support_Drift_Script_terraform12Update/Franklin-AWS-Terraform/us-east-1/lambda/dev/processS3ArchiveEvent.zip"
function_name = "processS3ArchiveEvent-lambda"
handler    = "processS3ArchiveEvent.lambda_handler"
runtime    = "python3.8"
source_code_hash   = "E:/aws drift script/branches/Support_Drift_Script_terraform12Update/Franklin-AWS-Terraform/us-east-1/lambda/dev/processS3ArchiveEvent.zip"
memory_size= "128"
timeout    = "10"
kms_key_arn= "arn:aws:kms:us-east-1:116762271881:key/6a8505fd-57e8-49de-a6a0-c1e7346f7a87"
subnet_ids = ["subnet-0734d8f28467d319f","subnet-06291ceaa523f684c"]
security_group_ids = ["sg-047b9d8e5399cd248","sg-02d874d3ba1230f74"]  
env = "dev"
sqs_url = "https://sqs.us-east-1.amazonaws.com/116762271881/s3_event_archive_incoming_dev"


s3_bucket_arn_list = ["arn:aws:s3:::franklin-dev-s3-access-logs/*"]
sqs_arn_list = ["arn:aws:sqs:us-east-1:116762271881:s3_event_archive_incoming_dev"]

tags ={
        "ApplicationName": "Hermes",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "Operations",
        "CreatedBy": "DevOps",
        "CreatedOn": "NoInfo",
        "DataClassification": "Low",
        "Department": "HMS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "Python",
        "Usage": "Project",
        "Version": "1.0"
}