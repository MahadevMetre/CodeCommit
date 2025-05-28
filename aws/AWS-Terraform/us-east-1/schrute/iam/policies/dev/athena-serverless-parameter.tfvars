iam_role_name				= "schrute-eks-execution-role-dev"

iam_role_tags = {
	"ApplicationName"		= "Schrute"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09092024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09092024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

iam_policy_name				= "schrute-parameter"
iam_role_id					= "schrute-eks-execution-role-dev"
schrute-parameter	        = "true"
ssm_parameter_arn           = "arn:aws:ssm:us-east-1:116762271881:parameter/athena-serverless-parameters-dev"
kms_key                     = "arn:aws:kms:us-east-1:116762271881:key/mrk-685b907882b4454cabd318a666c78aa6"