# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Scrute Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = true
tags            = {
	"ApplicationName"		= "Schrute"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09242024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09242024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
parameter_policy = true
alias_name        = "alias/schrute-parameter-dev/kms"
iam_arn         = [ "arn:aws:iam::116762271881:root",
                    "arn:aws:iam::116762271881:role/Franklin-Admin-NonProd",
                    "arn:aws:iam::116762271881:role/Franklin-Admin"]
iam_roles       = [ "arn:aws:iam::116762271881:role/Franklin-Admin-NonProd",
"arn:aws:iam::116762271881:role/forecast-ecs-task-execution-role-dev"]
multi_region    = true


