data "aws_caller_identity" "ses_acc_id" {}

resource "aws_iam_role_policy" "digital-serverless-ses" {
  count = var.digital-serverless-ses ? 1 : 0
  name  = var.iam_policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ses:SendEmail",
                "ses:SendRawEmail"
            ],
            "Resource": [
                "arn:aws:ses:*:${data.aws_caller_identity.ses_acc_id.account_id}:template/*",
                "arn:aws:ses:*:${data.aws_caller_identity.ses_acc_id.account_id}:configuration-set/*",
                "arn:aws:ses:*:${data.aws_caller_identity.ses_acc_id.account_id}:identity/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "ses:DeleteSuppressedDestination",
            "Resource": "*"
        }
    ]
})
}






