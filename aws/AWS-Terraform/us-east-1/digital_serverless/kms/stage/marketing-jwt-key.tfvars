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
    "CreatedOn" = "06072024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06122024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
marketing-kms-policy = true
alias_name        = "alias/fmg-marketing-jwt-stage"
iam_roles       = ["arn:aws:iam::702230634984:role/marketing-lambda-role-stage"]
key_administrators = ["arn:aws:iam::702230634984:role/marketing-lambda-role-stage"]
