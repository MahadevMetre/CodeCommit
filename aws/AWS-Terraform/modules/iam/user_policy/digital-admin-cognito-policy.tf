resource "aws_iam_policy" "digital-admin-cognito-policy" {
	count			=	var.digital-admin-cognito-policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cognito-idp:*"
            ],
            "Resource": [
                "arn:aws:cognito-idp:*:*:*"
            ]
        }
    ]
})
}