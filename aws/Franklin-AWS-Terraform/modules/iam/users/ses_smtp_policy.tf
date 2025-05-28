resource "aws_iam_user_policy" "ses_smtp_policy" {
	count			=	var.ses_policy ? 1 : 0
	name			=	"AmazonSesSendingAccess"
	user			=	aws_iam_user.myIamUser.name
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ses:SendRawEmail",
            "Resource": "*"
        }
    ]
    })
}