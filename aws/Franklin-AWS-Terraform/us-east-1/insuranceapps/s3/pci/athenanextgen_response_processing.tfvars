bucket_short_name = "athenanextgen-response-processing"
environment = "prod"
logging_bucket_name =  "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "insapps/athenanextgen-response-processing"
acl                 = "private"
tags ={
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "03112022"
    "DataClassification" = "PCI"
    "Department" = "ANG"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

#Policy Section
allow_api_user_policy = true
allowed_api_user_list        = ["arn:aws:iam::894891841990:user/AthenaNextGen-respproc-s3-Api-User-Prod"]
s3_vpc_endpoint = []
allowed_read_only_user_list       = ["arn:aws:iam::894891841990:user/AthenaNextGen-respproc-s3-Biz-User-Prod"]

#Lifecycle tranistion

lifecycle_tags		= {
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "03112022"
    "DataClassification" = "PCI"
    "Department" = "ANG"
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
replication_id                      = "athena-response-processing-replication"
s3_destination_arn                  = "arn:aws:s3:::athenanextgen-response-processing-dr"