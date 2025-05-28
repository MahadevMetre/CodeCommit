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
	"CreatedOn"				= "09192024"
	"DataClassification"	= "DR"
	"Department"			= "ANG2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09192024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
parameter_policy = true
alias_name        = "alias/athena-serverless-dr/kms"
iam_arn         = [ "arn:aws:iam::214946096060:root",
                    "arn:aws:iam::214946096060:role/Franklin-Admin"]
iam_roles       = [ "arn:aws:iam::214946096060:role/Franklin-Admin"]
multi_region    = true


