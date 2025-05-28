bucket_short_name = "athenanextgen-billing"
environment = "stage"
logging_bucket_name =  "franklin-stage-s3-access-logs"
logging_bucket_base_prefix = "insapps/athenanextgen-billing"
acl                 = "private"
tags ={
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "02162022"
    "DataClassification" = "Low"
    "Department" = "ANG"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

#Policy Section
allow_api_user_policy = true
allowed_api_user_list        = ["arn:aws:iam::894891841990:user/AthenaNextGen-billing-s3-Api-User-NonProd"]
s3_vpc_endpoint = []
allowed_read_only_user_list       = ["arn:aws:iam::894891841990:user/AthenaNextGen-billing-s3-Biz-User-NonProd"]

#Lifecycle tranistion

lifecycle_tags		= {
    "ApplicationName" = "AthenaNextGen"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "02162022"
    "DataClassification" = "Low"
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
versioning_enabled_bool				= false
mfa_delete							= false
lifecycle_id 					    = "Glacier_transition"
lifecycle_prefix					= ""

             