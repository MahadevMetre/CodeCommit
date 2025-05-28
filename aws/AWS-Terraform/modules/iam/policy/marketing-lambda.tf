resource "aws_iam_role_policy" "marketing-lambda-policy" {
  count = var.marketing-inline-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "ssm:GetParameter",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "SNS:Publish",
          "ses:SendEmail",
          "cognito-idp:AdminInitiateAuth"
        ],
        "Resource" : "var.parameter_arn",
        "Effect" : "Allow"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}