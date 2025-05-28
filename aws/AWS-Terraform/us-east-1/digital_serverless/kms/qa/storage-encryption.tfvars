# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encrypting Storage - EFS and EBS"
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
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06142024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
storage-encryption_policy = true
alias_name        = "alias/digital/kms/storage/qa"
iam_arn         = ["arn:aws:iam::634621569833:root"]
iam_roles       = ["arn:aws:iam::634621569833:role/Franklin-Admin"]
storage_roles   = [ "arn:aws:iam::634621569833:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]