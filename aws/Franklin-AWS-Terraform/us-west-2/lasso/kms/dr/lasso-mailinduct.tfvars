# Please update the policy value in kms-WithPolicy main.tf file
description					= "Encryption key for lasso mailinduct"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled					= true
enable_key_rotation			= false
tags						= {
	"ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02142023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02142023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "lasso-mailinduct-dr"
}
alias_name					= "alias/lasso-mailinduct-dr"
lasso-kms-policy			= true
multi_region				= true
iam_roles					= ["arn:aws:iam::214946096060:role/Franklin-Admin",
								"arn:aws:iam::214946096060:user/lasso-mailinduct-user-dr"]