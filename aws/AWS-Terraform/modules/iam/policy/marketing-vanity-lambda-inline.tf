data "aws_caller_identity" "marketing_vanity_lambda" {}

resource "aws_iam_role_policy" "marketing-vanity-lambda-inline-policy" {
  count = var.marketing-vanity-lambda-policy ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
	"Statement": [
		{
			"Action": "logs:CreateLogGroup",
			"Effect": "Allow",
			"Resource": "arn:aws:logs:us-east-1:${data.aws_caller_identity.marketing_vanity_lambda.account_id}:*"
		},
		{
			"Action": [
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Effect": "Allow",
			"Resource": "*",
			"Sid": "Cloudwatch"
		},
		{
			"Action": [
				"s3:PutObject",
				"s3:GetObject",
				"s3:RestoreObject",
				"s3:PutObjectTagging",
				"s3:DeleteObject"
			],
			"Effect": "Allow",
			"Resource": [
				"arn:aws:s3:::${var.s3_bucket_name}/*"
			],
			"Sid": "S3Permission"
		},
		{
			"Action": [
				"secretsmanager:DescribeSecret",
				"secretsmanager:GetSecretValue"
			],
			"Effect": "Allow",
			"Resource": "arn:aws:secretsmanager:us-east-1:${data.aws_caller_identity.marketing_vanity_lambda.account_id}:secret:${var.secrets_name}*",
			"Sid": "SecretsGet"
		},
		{
			"Action": [
				"ec2:CreateNetworkInterface",
				"ec2:DeleteNetworkInterface",
				"ec2:DescribeNetworkInterfaces"
			],
			"Effect": "Allow",
			"Resource": "*",
			"Sid": "VPC"
		}
	],
	"Version": "2012-10-17"
})
}