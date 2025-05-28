bucket_short_name = "gpsdataoutput"
environment = "dev"
logging_bucket_name =  "franklin-dev-s3-access-logs"
logging_bucket_base_prefix = "insapps/gpsdataoutput"
acl                 = "private"
tags ={
    "ApplicationName" = "GPSNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Graphics"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09222021"
    "DataClassification" = "Low"
    "Department" = "GPS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

#Policy Section
allow_api_user_policy = true
allowed_api_user_list        = ["arn:aws:iam::894891841990:user/GPSDataOutput-S3-Api-User-NonProd"]
s3_vpc_endpoint = []
allowed_read_only_user_list       = ["arn:aws:iam::894891841990:user/GPSBizUserNonProd"]

#Lifecycle tranistion

lifecycle_tags		= {
    "ApplicationName" = "GPSNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Graphics"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09302021"
    "DataClassification" = "Low"
    "Department" = "GPS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
 
lifecycle_enabled_bool				= true
lifecycle_transition_days			= "31"
lifecycle_storage_class				= "GLACIER"
versioning_enabled_bool				= false
mfa_delete							= false
lifecycle_id 					    = "Glacier_transition"
lifecycle_prefix					= ""