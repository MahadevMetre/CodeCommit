# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Atlas Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = true
tags            = {
    "ApplicationName" = "Atlas2.0"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "08302024"
    "DataClassification" = "PCI"
    "Department" = "ATS2"
    "Infrastructure" = "False"
    "LastUpdated" = "08302024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
parameter_policy = true
alias_name        = "alias/atlas/kms"
iam_arn         = [ "arn:aws:iam::601751840347:root",
                    "arn:aws:iam::601751840347:role/Franklin-Admin-Prod",
                    "arn:aws:iam::601751840347:role/Franklin-Admin"]
iam_roles       = [ "arn:aws:iam::601751840347:role/Franklin-Admin"]
multi_region    = true


