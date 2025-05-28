bucket_short_name = "digital-cloudfront-logger"
environment = "qa"
logging_bucket_name =  "franklin-qa-s3-access-logs"
logging_bucket_base_prefix = "dig/digital-cloudfront-logger"

aws_referer = "634621569833"

acl                 = "private" 
 
tags ={
        "ApplicationName": "Digital",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "DevOps",
        "CreatedOn": "09012021",
        "DataClassification": "Low",
        "Department": "DGT",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
lifecycle_enabled_bool = true
lifecycle_tags = {
        "ApplicationName": "Digital",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "DevOps",
        "CreatedOn": "09012021",
        "DataClassification": "Low",
        "Department": "DGT",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
lifecycle_id = "transition-glacier"
prefix = "/"
lifecycle_transition_days = 1
lifecycle_storage_class = "GLACIER"