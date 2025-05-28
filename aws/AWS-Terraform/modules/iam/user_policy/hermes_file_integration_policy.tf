resource "aws_iam_policy" "hermes_file_integration_policy" {
	count			=	var.hermes_file_integration_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"s3:GetObject",
				"s3:DeleteObject",
				"s3:ListBucket",
				"s3:ListBucketMultipartUploads",
				"s3:ListMultipartUploadParts",
				"s3:PutObject"
			],
			"Resource": [
				"arn:aws:s3:::hermes-file-integration-*"
			]
		}
	]
})
}