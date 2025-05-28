resource "aws_iam_user_policy_attachment" "lasso_kms_policy" {
	count			=	var.lasso_kms_policy ? 1 : 0
	user			=	aws_iam_user.myIamUser.name
	policy_arn		=	var.iam_policy_name
}