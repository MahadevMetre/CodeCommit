bucket_short_name = "gpsdataoutput"
environment = "dr"
logging_bucket_name =  "franklin-dr-s3-access-logs"
logging_bucket_base_prefix = "insapps/gpsdataoutput"
acl                 = "private"
tags ={
    "ApplicationName" = "GPSNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "Graphics"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "GPS"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}

#Policy Section
allow_api_user_policy_dr  = true
allowed_api_user_list        = ["arn:aws:iam::894891841990:user/GPSDataOutput-S3-Api-User-DR"]
s3_vpc_endpoint = []
allowed_read_only_user_list       = ["arn:aws:iam::894891841990:user/GPSBizUserDr"]

#Lifecycle tranistion

lifecycle_tags		= {
    "ApplicationName" = "GPSNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "Graphics"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "GPS"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
 
lifecycle_enabled_bool				= true
lifecycle_transition_days			= "31"
lifecycle_storage_class				= "GLACIER"
versioning_enabled_bool				= true
mfa_delete							= false
lifecycle_id 					    = "Glacier_transition"
lifecycle_prefix					= ""