resource "aws_iam_policy" "admins_policy" {
  count         = var.admins_policy ? 1 : 0
  name			=	var.iam_policy_name
  description	=	var.iam_policy_desc
  tags			=	var.iam_policy_tags
  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "codecommit:*",
        "Resource" : "arn:aws:codecommit:${var.region}:${var.account_id}:*"
      },
      {
        "Sid" : "2",
        "Effect" : "Allow",
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "kms:GenerateDataKeyWithoutPlaintext"
        ],
        "Resource" : "arn:aws:kms:us-east-1:964190570136:key/174785ac-2ab4-41e8-95c1-f80406578d0a"
      }
    ]
  })
}

