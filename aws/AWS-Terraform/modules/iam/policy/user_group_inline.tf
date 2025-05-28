resource "aws_iam_role_policy" "user_group_policy" {
  count = var.user_group_policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "execute-api:Invoke"
        ],
        "Resource" : "var.parameter_arn"
      }
    ]
  })
}