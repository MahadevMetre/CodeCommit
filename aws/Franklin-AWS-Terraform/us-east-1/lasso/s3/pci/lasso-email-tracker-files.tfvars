bucket_short_name = "lasso-email-tracker-files"
environment = "pci"
logging_bucket_name =  "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "lasso-email-tracker-files-pci"
acl                 = "private"
tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "sbose",
		"CreatedOn": "06152023",
		"DataClassification": "PCI",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06152023",
		"TechStack": "NoInfo",
		"Usage": "Project",
		"Version": "1.0"
		}
allow_ses_put_policy = true