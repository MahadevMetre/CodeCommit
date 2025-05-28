resource "aws_iam_role_policy" "ec2-start-stop-policy" {
  count = var.ec2-start-stop-policy ? 1 : 0
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
            "ec2:DescribeInstances",
            "ec2:StartInstances",
            "ec2:DescribeTags",
            "ec2:StopInstances",
            "lambda:InvokeFunction",
            "ses:SendEmail",
            "ses:SendRawEmail"
          ],
          "Resource" : "*"
        }
      ]
  })
}