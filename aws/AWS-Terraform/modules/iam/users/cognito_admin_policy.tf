resource "aws_iam_user_policy_attachment" "cognito_admin_policy" {
	count			=	var.cognito_admin_policy ? 1 : 0
	user			=	aws_iam_user.myIamUser.name
	policy_arn		=	var.iam_policy_name
}