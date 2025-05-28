# Please update the policy value in kms-WithPolicy main.tf file
description					= "Encryption key for encrypting the fmg serverless efs files"
key_usage					= "ENCRYPT_DECRYPT"
customer_master_key_spec	= "SYMMETRIC_DEFAULT"
is_enabled					= true
enable_key_rotation			= false
tags						= {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "09272023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "09272023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
alias_name					= "alias/fmg-serverless-efs-key-prod"
fmg-serverless-efs-policy	= true
multi_region				= true
iam_roles					= ["arn:aws:iam::361469336240:role/Franklin-Admin"]