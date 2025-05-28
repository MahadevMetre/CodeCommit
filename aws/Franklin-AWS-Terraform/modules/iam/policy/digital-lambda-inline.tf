resource "aws_iam_role_policy" "lambda-policy" {
  count = var.lambda-inline-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Action" : [
          "ssm:GetParameter",
          "SNS:Publish",
          "ses:SendEmail"
        ],
        "Resource" : "${var.parameter_arn}",
        "Effect" : "Allow"
      },
      {
        "Effect" : "Allow",
        "Action" : "sqs:SendMessage",
        "Resource" : "${var.sqs_arn_val}"
      }
    ]
  })
}