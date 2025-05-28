resource "aws_iam_role_policy" "hermes-job-launcher-role-policy" {
  count = var.hermes-job-launcher-role-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : [
            "lambda:InvokeFunction"
          ],
          "Resource" : "*"
        }
      ]
  })
}