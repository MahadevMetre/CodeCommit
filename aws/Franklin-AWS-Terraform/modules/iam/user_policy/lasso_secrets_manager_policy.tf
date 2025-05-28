data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "lasso_secrets_mgr_policy" {
	count			=	var.lasso_secrets_mgr_policy ? 1 : 0
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
                "kms:DescribeKey",
                "kms:ListAliases",
                "kms:ListKeys",
				"lambda:ListFunctions",
				"rds:DescribeDBClusters",
				"rds:DescribeDBInstances",
				"secretsmanager:GetRandomPassword",
				"secretsmanager:ListSecrets",
				"tag:GetResources"
			],
			"Resource": "*"
		},
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": [
				"secretsmanager:DescribeSecret",
				"secretsmanager:GetResourcePolicy",
				"secretsmanager:GetSecretValue",
				"secretsmanager:ListSecretVersionIds"
			],
			"Resource": "arn:aws:secretsmanager:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:secret:lasso-*"
		}
	]
})
}