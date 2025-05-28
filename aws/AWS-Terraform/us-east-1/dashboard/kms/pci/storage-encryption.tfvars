# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for RDS instance"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = false
tags            = {
    "ApplicationName" = "DashBoard"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09182024"
    "DataClassification" = "PCI"
    "Department" = "DSB"
    "Infrastructure" = "False"
    "LastUpdated" = "09182024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
fmg_rds_kms_policy = true
alias_name        = "alias/dashboard/kms/pci"
iam_arn         = ["arn:aws:iam::601751840347:root"]
iam_roles       = ["arn:aws:iam::601751840347:role/Franklin-Admin"]
storage_roles   = ["arn:aws:iam::601751840347:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]

