module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				       = var.iam_policy_name
	iam_policy_desc				       = var.iam_policy_desc
	iam_policy_tags				       = var.iam_policy_tags
	proteus2_kms_policy                = var.proteus2_kms_policy
	proteus2_acxiom_olmb_lambda_policy = var.proteus2_acxiom_olmb_lambda_policy
	bucket_env					       = var.bucket_env
}