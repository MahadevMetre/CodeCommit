resource "aws_iam_policy" "hermes_s3_access_policy" {
	count			=	var.hermes_s3_access_policy ? 1 : 0
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
				"s3:Create*",
				"s3:Delete*",
				"s3:Describe*",
				"s3:Get*",
				"s3:List*",
				"s3:Put*",
				"s3:Update*"
			],
			"Resource": [
				"arn:aws:s3:::pycharm-serverless-*",
				"arn:aws:s3:::hermes-file-integration-*",
				"arn:aws:s3:::hermes-batch-processor-*"
			]
		}
	]
})
}