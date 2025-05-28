bucket_short_name = "gpsdataoutput"
environment = "prod"
logging_bucket_name =  "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "insapps/gpsdataoutput"
acl                 = "private"
tags ={
    "ApplicationName" = "GPSNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Graphics"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "10212021"
    "DataClassification" = "PCI"
    "Department" = "GPS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

#Policy Section
allow_api_user_policy = true
allowed_api_user_list        = ["arn:aws:iam::894891841990:user/GPSDataOutput-S3-Api-User-Prod"]
s3_vpc_endpoint = []
allowed_read_only_user_list       = ["arn:aws:iam::894891841990:user/GPSBizUserProd"]

#Lifecycle tranistion

lifecycle_tags		= {
    "ApplicationName" = "GPSNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Graphics"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "10212021"
    "DataClassification" = "PCI"
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
versioning_enabled_bool				= true
mfa_delete							= false
lifecycle_id 					    = "Glacier_transition"
lifecycle_prefix					= ""

#replication_configuration
replication  = true
iam_role_replication_arn            = "arn:aws:iam::601751840347:role/franklin-pci-to-dr-s3replication-role"
status                              = "Enabled"
replication_id                      = "gpsdataoutput-replication"
s3_destination_arn                  = "arn:aws:s3:::gpsdataoutput-dr"