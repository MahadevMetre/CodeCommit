file_name  = "processS3ArchiveEvent.zip"
function_name = "processS3ArchiveEvent-lambda"
handler    = "processS3ArchiveEvent.lambda_handler"
runtime    = "python3.8"
source_code_hash   = "processS3ArchiveEvent.zip"
memory_size= "128"
timeout    = "10"
kms_key_arn= "arn:aws:kms:us-east-1:702230634984:key/a0297974-4802-4abb-9db4-bba7e7a4f5cd"
subnet_ids = ["subnet-076a071fa0723c80e","subnet-0ed61b6beb807094e"]
security_group_ids = ["sg-008b9810e07f1a49f"]  
env = "stage"
environment = [{
    variables {
        sqs_url = "https://sqs.us-east-1.amazonaws.com/702230634984/s3_event_archive_incoming_stage",
        fmg_cuscomm_s3access_role = "arn:aws:iam::361469336240:role/franklin-prod-processS3ArchiveEvent-lambda-role",
        fmg_ins_s3access_logs_bucket = "franklin-stage-s3-access-logs",
        fmg_cuscomm_s3access_logs_bucket = "franklin-dev-s3-access-logs",
        sns_topic = "arn:aws:sns:us-east-1:702230634984:processS3ArchiveEvent_error_sns_stage"
        sns_subject = "ERROR PROCESSS3 ARCHIVE LAMBDA"
    }
}]

s3_bucket_arn_list = ["arn:aws:s3:::franklin-stage-s3-access-logs/*","arn:aws:s3:::franklin-dev-s3-access-logs/*"]
sqs_arn_list = ["arn:aws:sqs:us-east-1:702230634984:s3_event_archive_incoming_stage"]

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