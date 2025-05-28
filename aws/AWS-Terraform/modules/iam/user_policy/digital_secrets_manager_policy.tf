data "aws_region" "digital_current" {}
data "aws_caller_identity" "digital_current" {}

resource "aws_iam_policy" "digital_secrets_mgr_policy" {
	count			=	var.digital_secrets_mgr_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": [
				"secretsmanager:DescribeSecret",
				"secretsmanager:GetSecretValue"
			],
			"Resource": "arn:aws:secretsmanager:${data.aws_region.digital_current.name}:${data.aws_caller_identity.digital_current.account_id}:secret:${var.secrets_name}*"
		}
	]
})
}