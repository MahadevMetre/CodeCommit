# Please update the policy value in kms-WithPolicy main.tf file
description					= "Encryption key for encrypting the fmg serverless efs files"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled					= true
enable_key_rotation			= false
tags						= {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
alias_name					= "alias/fmg-pycharm-storage-key-qa"
storage-encryption-key-policy	= true
multi_region				= false
iam_roles					= ["arn:aws:iam::634621569833:role/Franklin-Admin",
								"arn:aws:iam::634621569833:role/Franklin-Admin-NonProd"]