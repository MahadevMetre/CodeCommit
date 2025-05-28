resource "aws_iam_role_policy" "atlas-serverless-parameter" {
  count = var.atlas-serverless-parameter ? 1 : 0
  name  = var.iam_policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": var.ssm_parameter_arn
        }
    ]
  })
}
