resource "aws_iam_role_policy" "ip-unauth-policy" {
  count = var.ip-unauth-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "mobileanalytics:PutEvents",
          "cognito-sync:*"
        ],
        "Resource" : [
          "*"
        ]
      }
    ]
  })
}   