role_name = "marketing-vanity-lambda-role-qa"
policy_name = "marketing-vanity-lambda-policy"
role_tags = {
	"Department": "MKT"
	"LastUpdated": "06132024"
	"CostCenter": "FMG"
	"CreatedOn": "06132024"
	"DataClassification": "None"
	"Infrastructure": "False"
	"Usage":"Project"
	"Version": "1.0"
	"ApplicationName": "Marketing"
	"TechStack": "AWS"
	"Automated": "True"
	"BackupPlan": "None"
	"CreatedBy": "DevOps"
}
marketing-vanity-lambda-policy = true
s3_bucket_name = "marketing-vanity-automation-qa"
secrets_name = "marketing-vanity-secrets-qa"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::634621569833:policy/digital-vpc-access-policy-qa"
marketing-dynamodb-policy			= true
marketing_dynamodb_policy_arn		= "arn:aws:iam::634621569833:policy/marketing-dynamodb-policy-qa"
marketing_kms_policy      			= true
marketing_kms_policy_arn		    = "arn:aws:iam::634621569833:policy/marketing-kms-policy-qa"