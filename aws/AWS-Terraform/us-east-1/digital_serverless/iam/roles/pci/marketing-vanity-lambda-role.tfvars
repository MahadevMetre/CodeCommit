role_name = "marketing-vanity-lambda-role-pci"
policy_name = "marketing-vanity-lambda-policy"
role_tags = {
	"Department": "MKT"
	"LastUpdated": "06262024"
	"CostCenter": "FMG"
	"CreatedOn": "06262024"
	"DataClassification": "PCI"
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
s3_bucket_name = "marketing-vanity-automation-pci"
secrets_name = "marketing-vanity-secrets-pci"
digital-vpc-access-policy			= true
digital_vpc_access_policy_arn		= "arn:aws:iam::601751840347:policy/digital-vpc-access-policy-pci"
marketing-dynamodb-policy			= true
marketing_dynamodb_policy_arn		= "arn:aws:iam::601751840347:policy/marketing-dynamodb-policy-pci"
marketing_kms_policy      			= true
marketing_kms_policy_arn		    = "arn:aws:iam::601751840347:policy/marketing-kms-policy-pci"