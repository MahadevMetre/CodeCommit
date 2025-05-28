bucket_short_name = "lasso-email-tracker-files"
environment = "dr"
logging_bucket_name =  "franklin-dr-s3-access-logs"
logging_bucket_base_prefix = "lasso-email-tracker-files-dr"
acl                 = "private"
tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "mfaizudeen",
		"CreatedOn": "06162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06162023",
		"TechStack": "NoInfo",
		"Usage": "Project",
		"Version": "1.0"
		}
allow_ses_put_policy = true