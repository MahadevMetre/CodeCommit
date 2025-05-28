resource "aws_iam_policy" "digital-cognito-up-sms-policy" {
  count = var.digital-cognito-up-sms-policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
                   "sns:publish"        
                   ],
        "Resource" : "*"
        "Effect" : "Allow"
      }
    ]
  })
}