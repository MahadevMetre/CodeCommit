resource "aws_iam_policy" "cognito_admin_policy" {
	count			=	var.cognito_admin_policy ? 1 : 0
	name			=	var.iam_policy_name
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "cognito-idp:*",
            "Resource": [
                "arn:aws:cognito-idp:*:*:*"
            ]
        }
    ]
    })
}