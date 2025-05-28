bucket_short_name = "hermes-file-integration-payload"
environment = "prod"
logging_bucket_name =  "franklin-prod-s3-access-logs"
logging_bucket_base_prefix = "hermes-file-integration-payload-prod"
acl                 = "private"
tags ={
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08222023"
	"CostCenter"			= "Operations"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08222023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
s3_enable_lifecycle_config = true
s3_lifecycle_days = 180
versioning_enabled_bool				= true

#replication_configuration
replication  = true
iam_role_replication_arn            = "arn:aws:iam::361469336240:role/franklin-prod-to-dr-S3replication-role"
status                              = "Enabled"
replication_id                      = "hermes-file-integration-payload-replication"
s3_destination_arn                  = "arn:aws:s3:::hermes-file-integration-payload-dr"