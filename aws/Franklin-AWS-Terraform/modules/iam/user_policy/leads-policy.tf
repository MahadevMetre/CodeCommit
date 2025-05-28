resource "aws_iam_policy" "leads_policy" {
  count = var.leads_policy ? 1 : 0
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
          "codecommit:GitClone",
          "codecommit:ListRepositories",
          "codecommit:CreateRepository",
          "codecommit:GetRepository",
          "codecommit:UpdateRepositoryDescription",
          "codecommit:UpdateRepositoryName",
          "codecommit:ListBranches",
          "codecommit:CreateBranch",
          "codecommit:GetBranch",
          "codecommit:UpdateDefaultBranch",
          "codecommit:GetRepositoryTriggers",
          "codecommit:PutRepositoryTriggers",
          "codecommit:TestRepositoryTriggers",
          "codecommit:ListRepositoriesForApprovalRuleTemplate",
          "codecommit:AssociateApprovalRuleTemplateWithRepository",
          "codecommit:ListPullRequestApprovalRules",
          "codecommit:MergePullRequestByFastForward",
          "codecommit:MergePullRequestBySquash",
          "codecommit:MergePullRequestByThreeWay",
          "codecommit:RevertPullRequestApprovalState",
          "codecommit:EvaluatePullRequestApprovalRules",
          "codecommit:GetCommentsForPullRequest",
          "codecommit:GetMergeConflicts",
          "codecommit:GetPullRequest",
          "codecommit:GetPullRequestApprovalStates",
          "codecommit:GetPullRequestOverrideState",
          "codecommit:ListPullRequests",
          "codecommit:PostCommentForPullRequest",
          "codecommit:UpdatePullRequestApprovalState",
          "codecommit:UpdatePullRequestDescription"
        ],
        "Resource" : [
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/mt/*",
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/ui/*"
        ]
      },
      {
        "Effect" : "Deny",
        "Action" : "codecommit:GitPush",
        "Resource" : [
          "arn:aws:codecommit:${var.region}:${var.account_id}:${var.repository_name}/*/tags/*"
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

