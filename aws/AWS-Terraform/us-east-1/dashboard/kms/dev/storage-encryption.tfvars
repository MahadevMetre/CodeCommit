# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for RDS instance"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = false
tags            = {
    "ApplicationName" = "Dashboard"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "06072024"
    "DataClassification" = ""
    "Department" = ""
    "Infrastructure" = "False"
    "LastUpdated" = "06072024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
fmg_rds_kms_policy = true
alias_name        = "alias/dashboard/kms/dev"
iam_arn         = ["arn:aws:iam::116762271881:root"]
iam_roles       = ["arn:aws:iam::116762271881:role/Franklin-Admin"]
storage_roles   = ["arn:aws:iam::116762271881:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]

# key_users = ["TO BE UPDATED"]
