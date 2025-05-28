# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = false
tags            = {
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
parameter_policy = true
alias_name        = "alias/digital/kms/pci"
iam_arn         = ["arn:aws:iam::601751840347:root"]
iam_roles       = ["arn:aws:iam::601751840347:role/Franklin-Admin",
"arn:aws:iam::601751840347:role/marketing-lambda-role-pci",
"arn:aws:iam::601751840347:role/digital-lambda-role-pci"]