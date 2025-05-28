module "iam_user" {
	source					        = "../../../../modules/iam/users/"
	iam_user_name			        = var.iam_user_name
	iam_user_tags			        = var.iam_user_tags
	iam_policy_name		 	        = var.iam_policy_name
	proteus_s3_access_policy        = var.proteus_s3_access_policy
}