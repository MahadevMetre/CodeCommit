resource "aws_s3_bucket_policy" "cf_oai_policy" {
  count    = var.cloudfront_oai_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
	{
		"Version": "2008-10-17",
		"Id": "PolicyForCloudFrontPrivateContent",
		"Statement": [
			{
				"Sid": "1",
				"Effect": "Allow",
				"Principal": {
					"AWS": "${var.cloudfront_oai_arn}"
				},
				"Action": "s3:GetObject",
				"Resource": "arn:aws:s3:::${var.s3_bucketName}/*"
			}
		]
	}
POLICY
}