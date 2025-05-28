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
    "CreatedOn" = "06142024"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06142024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
parameter_policy = true
alias_name        = "alias/digital/kms/qa"
iam_arn         = ["arn:aws:iam::634621569833:root"]
iam_roles       = ["arn:aws:iam::634621569833:role/Franklin-Admin",
"arn:aws:iam::634621569833:role/marketing-lambda-role-qa",
"arn:aws:iam::634621569833:role/digital-lambda-role-qa"]