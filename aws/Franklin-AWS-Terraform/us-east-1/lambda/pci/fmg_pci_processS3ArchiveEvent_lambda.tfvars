file_name  = "processS3ArchiveEvent.zip"
function_name = "processS3ArchiveEvent-lambda"
handler    = "processS3ArchiveEvent.lambda_handler"
runtime    = "python3.8"
source_code_hash   = "processS3ArchiveEvent.zip"
memory_size= "128"
timeout    = "20"

kms_key_arn= "arn:aws:kms:us-east-1:601751840347:key/d6edd647-6a39-4281-bde1-8874035d11af"

subnet_ids = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_group_ids = ["sg-06fb67b2feff9f1b3"]  
env = "pci"
environment = [{
    variables {
        sqs_url = "https://sqs.us-east-1.amazonaws.com/601751840347/s3_event_archive_incoming_pci",
        fmg_cuscomm_s3access_role = "arn:aws:iam::361469336240:role/franklin-prod-crossacc-processS3ArchiveEvent-lambda-pci-role",
        fmg_ins_s3access_logs_bucket = "franklin-pci-s3-access-logs",
        fmg_cuscomm_s3access_logs_bucket = "franklin-prod-s3-access-logs",
        sns_topic = "arn:aws:sns:us-east-1:601751840347:processS3ArchiveEvent_error_sns_pci"
        sns_subject = "ERROR - ProcessS3Archive Event Lambda function"
    }
}]

s3_bucket_arn_list = ["arn:aws:s3:::franklin-pci-s3-access-logs/*","arn:aws:s3:::franklin-prod-s3-access-logs/*"]
sqs_arn_list = ["arn:aws:sqs:us-east-1:601751840347:s3_event_archive_incoming_pci"]

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
