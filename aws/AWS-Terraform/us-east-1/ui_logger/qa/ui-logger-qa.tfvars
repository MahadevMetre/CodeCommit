project_name="ui-logger"
env="qa"
lambda_desc = "Lambda to write logs into s3 bucket"
lambda_memory = 128
lambda_runtime ="python3.9"
lambda_timeout = 29
tags = {
	    "ApplicationName": "DevOps",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "sbose",
        "CreatedOn": "10062022",
        "DataClassification": "Low",
        "Department": "DOS",
        "Infrastructure": "False",
        "LastUpdated": "01182024",
        "TechStack": "Python",
        "Usage": "Project",
        "Version": "1.0"
}
s3_lifecycle_days = 90
noncurrent_days = 90
noncurrent_version_expiration = 2