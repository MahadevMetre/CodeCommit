resource "aws_iam_policy" "marketing-dynamodb-policy" {
	count			=	var.marketing-dynamodb-policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGetItem",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:CreateTableReplica",
                "dynamodb:ListTagsOfResource",
                "dynamodb:UpdateContributorInsights",
                "dynamodb:Query",
                "dynamodb:UpdateGlobalTable",
                "dynamodb:UpdateItem",
                "dynamodb:CreateBackup",
                "dynamodb:UpdateTableReplicaAutoScaling",
                "dynamodb:UpdateContinuousBackups",
                "dynamodb:CreateTable",
                "dynamodb:UpdateGlobalTableSettings",
                "dynamodb:DescribeTable",
                "dynamodb:GetItem",
                "dynamodb:UpdateGlobalTableVersion",
                "dynamodb:CreateGlobalTable",
                "dynamodb:GetResourcePolicy",
                "dynamodb:UpdateTable"
            ],
            "Resource": "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.kms_acc_id.account_id}:table/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "dynamodb:UpdateGlobalTableSettings",
                "dynamodb:UpdateContributorInsights",
                "dynamodb:UpdateGlobalTableVersion",
                "dynamodb:Query",
                "dynamodb:CreateGlobalTable",
                "dynamodb:UpdateGlobalTable",
                "dynamodb:GetResourcePolicy"
            ],
            "Resource": [
                "arn:aws:dynamodb::${data.aws_caller_identity.kms_acc_id.account_id}:global-table/*",
                "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.kms_acc_id.account_id}:table/*/stream/*",
                "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.kms_acc_id.account_id}:table/*/index/*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "dynamodb:ListContributorInsights",
                "dynamodb:ListGlobalTables",
                "dynamodb:ListTables",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:ListImports",
                "dynamodb:DescribeEndpoints",
                "dynamodb:ListExports"
            ],
            "Resource": "*"
        }
      ]
  })
}