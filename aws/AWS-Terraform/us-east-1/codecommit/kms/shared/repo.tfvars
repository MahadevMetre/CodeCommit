# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encrypting Code Commit Repositories"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = true
tags            = {
    "ApplicationName" = "DevOps"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "04092024"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "04092024"
    "TechStack" = "AWS"
    "Usage" = "DevOps"
    "Version" = "1.0"
}
repo-kms-policy = true
alias_name      = "alias/codecommit/repo"
iam_roles       = [ "arn:aws:iam::964190570136:role/Franklin-Admin",
                    "arn:aws:iam::964190570136:role/Franklin-Admin-NonProd",
                    "arn:aws:iam::964190570136:role/Franklin-DevOps",
                ]
user_roles      = [ "arn:aws:iam::964190570136:role/admins-role-shared",
                    "arn:aws:iam::964190570136:role/automation-qa-lead-role-shared",
                    "arn:aws:iam::964190570136:role/leads-role-shared",
                    "arn:aws:iam::964190570136:role/rml-role-shared",
                    "arn:aws:iam::964190570136:role/support-ui-dev-role-shared",
                    "arn:aws:iam::964190570136:role/ui-dev-role-shared"]