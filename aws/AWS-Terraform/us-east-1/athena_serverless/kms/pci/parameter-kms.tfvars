# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Athena Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = true
tags            = {
    "ApplicationName"		= "AthenaNextgen2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182024"
	"DataClassification"	= "PCI"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
parameter_policy = true
alias_name        = "alias/athena-serverless-pci/kms"
iam_arn         = ["arn:aws:iam::601751840347:root"]
iam_roles       = ["arn:aws:iam::601751840347:role/Franklin-Admin"]
multi_region    = true


