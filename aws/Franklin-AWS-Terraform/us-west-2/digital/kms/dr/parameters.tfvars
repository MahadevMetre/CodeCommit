# Please update the policy value in kms-WithPolicy main.tf file
description     = "Encryption key for Parameter store"
key_usage       = "ENCRYPT_DECRYPT"
customer_master_key_spec = "SYMMETRIC_DEFAULT"
is_enabled      = true
enable_key_rotation = false
tags            = {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "selfservice-parameters-dr"
}
parameter_policy = true
alias_name        = "alias/digital/kms/dr"
iam_arn         = ["arn:aws:iam::214946096060:root"]
iam_roles       = ["arn:aws:iam::214946096060:role/Franklin-Admin",
"arn:aws:iam::214946096060:role/marketing-lambda-role-dr",
"arn:aws:iam::214946096060:role/digital-lambda-role-dr"]