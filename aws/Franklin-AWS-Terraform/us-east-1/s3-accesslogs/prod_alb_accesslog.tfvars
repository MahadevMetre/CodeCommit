s3_bucketName       = "franklin-alb-access-logs"
environment         = "prod"
acl                 = "private"
tags                = {
	"ApplicationName" = "DevOps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "NoInfo"
	"DataClassification" = "Low"
	"Department" = "DOS"
	"Infrastructure" = "False"
	"LastUpdated" = "06262023"
	"Name" = "franklin-alb-access-logs-prod"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	}

# Policy
alb_access_log_policy_generic		= true