resource "aws_iam_role_policy" "cloudfront-sg-update-lambda-policy" {
  count = var.cloudfront-sg-update-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "CloudWatchPermissions",
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:*:*"
        },
        {
          "Sid" : "EC2Permissions",
          "Effect" : "Allow",
          "Action" : [
            "ec2:DescribeSecurityGroups",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:RevokeSecurityGroupIngress",
            "ec2:CreateSecurityGroup",
            "ec2:DescribeVpcs",
            "ec2:CreateTags",
            "ec2:ModifyNetworkInterfaceAttribute",
            "ec2:DescribeNetworkInterfaces"
          ],
          "Resource" : "*"
        }
      ]
  })
}