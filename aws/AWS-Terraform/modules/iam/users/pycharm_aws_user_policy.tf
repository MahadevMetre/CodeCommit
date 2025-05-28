resource "aws_iam_user_policy_attachment" "pycharm_aws_user_policy" {
	count			=	var.pycharm_aws_user_policy ? 1 : 0
	user			=	aws_iam_user.myIamUser.name
	policy_arn		=	var.iam_policy_name
}