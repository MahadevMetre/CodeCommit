resource "aws_iam_policy" "proteus_s3_access_policy" {
	count			=	var.proteus_s3_access_policy ? 1 : 0
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
				"s3:PutObject",
				"s3:GetObject",
				"s3:RestoreObject",
				"s3:ListBucket",
				"s3:PutObjectTagging"
			],
			"Resource": [
				"arn:aws:s3:::proteus-axciom-feed-${var.bucket_env}",
				"arn:aws:s3:::proteus-axciom-feed-${var.bucket_env}/*"
			]
		}
	]
})
}