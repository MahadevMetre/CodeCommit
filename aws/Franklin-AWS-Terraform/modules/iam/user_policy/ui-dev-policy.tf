resource "aws_iam_policy" "ui_dev_policy" {
  count = var.ui_dev_policy ? 1 : 0
  name			=	var.iam_policy_name
  description	=	var.iam_policy_desc
  tags			=	var.iam_policy_tags
  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "codecommit:List*",
          "codecommit:GitPull",
          "codecommit:GitPush",
          "codecommit:CreatePullRequest"
        ],
        "Resource" : [
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/schrute/ui/*",
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/socrates/ui/*"
        ]
      },
      {
        "Effect" : "Deny",
        "Action" : "codecommit:GitPush",
        "Resource" : [
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/tags/*",
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/master/*"
        ]
      },
      {
        "Effect" : "Deny",
        "Action" : [
          "codecommit:MergeBranchesByFastForward",
          "codecommit:MergePullRequestBySquash",
          "codecommit:MergePullRequestByThreeWay"
        ],
        "Resource" : [
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/schrute/ui/*",
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/socrates/ui/*",
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/master/*"
        ]
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
