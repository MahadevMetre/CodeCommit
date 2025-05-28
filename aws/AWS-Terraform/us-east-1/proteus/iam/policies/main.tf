module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				= var.iam_policy_name
	iam_policy_desc				= var.iam_policy_desc
	iam_policy_tags				= var.iam_policy_tags
	proteus_s3_access_policy    = var.proteus_s3_access_policy
	bucket_env					= var.bucket_env
}