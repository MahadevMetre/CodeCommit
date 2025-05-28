# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Digital Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = true
tags            = {
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "07102024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "07102024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
parameter_policy = true
alias_name        = "alias/digital/kms"
iam_arn         = [ "arn:aws:iam::702230634984:root",
                    "arn:aws:iam::702230634984:role/Franklin-Admin-NonProd",
                    "arn:aws:iam::702230634984:role/Franklin-Admin"]
iam_roles       = [ "arn:aws:iam::702230634984:role/Franklin-Admin-NonProd"]
multi_region    = true