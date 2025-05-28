resource "aws_iam_policy" "lasso_s3_access_policy" {
	count			=	var.lasso_s3_access_policy ? 1 : 0
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
				"s3:ListBucketVersions",
				"s3:RestoreObject",
				"s3:ListBucket",
				"s3:PutObjectTagging",
				"s3:DeleteObject"
			],
			"Resource": [
				"arn:aws:s3:::insclaimsbockserver-${var.bucket_env}",
				"arn:aws:s3:::insclaimsbockserver-${var.bucket_env}/*",
				"arn:aws:s3:::insuranceclaimscabinet-${var.bucket_env}",
				"arn:aws:s3:::insuranceclaimscabinet-${var.bucket_env}/*",
				"arn:aws:s3:::insurancenontermcabinet-${var.bucket_env}",
				"arn:aws:s3:::insurancenontermcabinet-${var.bucket_env}/*",
				"arn:aws:s3:::insurancetermcabinet-${var.bucket_env}",
				"arn:aws:s3:::insurancetermcabinet-${var.bucket_env}/*",
				"arn:aws:s3:::lasso-batch-files-${var.bucket_env}",
				"arn:aws:s3:::lasso-batch-files-${var.bucket_env}/*",
				"arn:aws:s3:::lasso-claims-tracker-files-${var.bucket_env}",
				"arn:aws:s3:::lasso-claims-tracker-files-${var.bucket_env}/*",
				"arn:aws:s3:::lasso-email-tracker-files-${var.bucket_env}",
				"arn:aws:s3:::lasso-email-tracker-files-${var.bucket_env}/*",
				"arn:aws:s3:::lasso-scanned-files-${var.bucket_env}",
				"arn:aws:s3:::lasso-scanned-files-${var.bucket_env}/*"
			]
		},
		{
			"Sid": "VisualEditor1",
			"Effect": "Allow",
			"Action": [
				"s3:ListAccessPointsForObjectLambda",
				"s3-object-lambda:*"
			],
			"Resource": "*"
		}
	]
})
}