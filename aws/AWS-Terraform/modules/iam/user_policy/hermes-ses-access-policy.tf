resource "aws_iam_policy" "hermes-ses-access-policy" {
  count = var.hermes-ses-access-policy ? 1 : 0
  name  = var.iam_policy_name
  description		=	var.iam_policy_desc
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "SendEmailPermission",
          "Effect" : "Allow",
          "Action" : [
              "ses:SendEmail",
              "ses:SendRawEmail"
          ],
          "Resource" : var.parameter_arn
        },
        {
            "Sid": "DeleteSuppressionList",
            "Effect": "Allow",
            "Action": "ses:DeleteSuppressedDestination",
            "Resource": "*"
        }
      ]
  })
}

resource "aws_iam_policy_attachment" "policy-attach" {
  count = var.hermes-ses-access-policy ? 1 : 0
  name       = "test-attachment"
  roles      = [var.iam_role_id]
  policy_arn = aws_iam_policy.hermes-ses-access-policy[0].arn
}