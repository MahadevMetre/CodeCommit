name        = "athena-serverless-parameters-dr"
description = "Parameter Store for Athena Service"
type        = "SecureString"
value       = "{\"connectionTimeOut\":\"180000\",\"mximumPoolSize\":\"200\",\"minimumIdle\":\"200\",\"mkUserRight\":\"187\"}"
key_id      = "alias/athena-serverless-dr/kms"
tier        = "Standard"
tags = {
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