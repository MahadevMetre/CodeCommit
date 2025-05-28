resource "aws_s3_bucket_policy" "alb_access_log_generic" {
  count    = var.alb_access_log_policy_generic ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::127311923021:root"
			},
			"Action": "s3:PutObject",
			"Resource": [
				"arn:aws:s3:::${var.s3_bucketName}",
				"arn:aws:s3:::${var.s3_bucketName}/*"
			]
		}
	]
}
POLICY
}