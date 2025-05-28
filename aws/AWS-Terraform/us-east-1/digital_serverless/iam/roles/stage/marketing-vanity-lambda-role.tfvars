role_name = "marketing-vanity-lambda-role-stage"
policy_name = "marketing-vanity-lambda-policy"
role_tags = {
	"Department": "MKT"
	"LastUpdated": "05182024"
	"CostCenter": "FMG"
	"CreatedOn": "05182024"
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
s3_bucket_name = "marketing-vanity-automation-stage"
secrets_name = "marketing-vanity-secrets-stage"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::702230634984:policy/digital-vpc-access-policy-stage"
marketing-dynamodb-policy			= true
marketing_dynamodb_policy_arn		= "arn:aws:iam::702230634984:policy/marketing-dynamodb-policy-stage"
marketing_kms_policy      			= true
marketing_kms_policy_arn		    = "arn:aws:iam::702230634984:policy/marketing-kms-policy-stage"