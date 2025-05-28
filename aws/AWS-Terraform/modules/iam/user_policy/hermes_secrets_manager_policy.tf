data "aws_region" "hms_secrets_policy" {}
data "aws_caller_identity" "hms_secrets_policy" {}

resource "aws_iam_policy" "hermes_secrets_mgr_policy" {
	count			=	var.hermes_secrets_mgr_policy ? 1 : 0
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
			"Resource": "arn:aws:secretsmanager:${data.aws_region.hms_secrets_policy.name}:${data.aws_caller_identity.hms_secrets_policy.account_id}:secret:hermes-*"
		}
	]
})
}