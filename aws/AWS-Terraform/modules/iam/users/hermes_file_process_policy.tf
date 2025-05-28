resource "aws_iam_user_policy_attachment" "hermes_file_process_policy" {
	count			=	var.hermes_file_process_policy ? 1 : 0
	user			=	aws_iam_user.myIamUser.name
	policy_arn		=	var.iam_policy_name
}