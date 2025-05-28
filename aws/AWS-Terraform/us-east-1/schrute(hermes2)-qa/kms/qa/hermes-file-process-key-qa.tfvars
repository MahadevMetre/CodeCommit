# Please update the policy value in kms-WithPolicy main.tf file
description					= "Encryption key for encrypting the contents in the file-integration bucket payload folder"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled					= true
enable_key_rotation			= false
tags						= {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05202024"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "05202024"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
alias_name					= "alias/hermes-file-process-key-qa"
hermes-file-process-policy	= true
multi_region				= true
iam_roles					= ["arn:aws:iam::634621569833:role/Franklin-Admin",
								"arn:aws:iam::634621569833:role/Franklin-Admin-NonProd",
								"arn:aws:iam::634621569833:user/hermes-file-process-user-qa"]