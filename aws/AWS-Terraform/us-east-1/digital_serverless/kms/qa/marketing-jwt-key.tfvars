# Please update the policy value in kms-WithPolicy main.tf file
description     = "CMK for Marketing JWT validation"
key_usage       = "SIGN_VERIFY"
customer_master_key_spec = "RSA_2048"
is_enabled      = true
enable_key_rotation = false
tags            = {
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "06142024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06142024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
marketing-kms-policy = true
alias_name        = "alias/fmg-marketing-jwt-qa"
iam_roles       = ["arn:aws:iam::634621569833:role/marketing-vanity-lambda-role-qa"]
key_administrators = ["arn:aws:iam::634621569833:role/marketing-vanity-lambda-role-qa"]