data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "allow_ses_put_policy" {
  count    = var.allow_ses_put_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
	{
		"Version": "2012-10-17",
		"Statement": [
			{
				"Sid": "SESPutPolicy",
				"Effect": "Allow",
				"Principal": {
					"Service": "ses.amazonaws.com"
				},
				"Action": "s3:PutObject",
				"Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
				"Condition": {
					"StringEquals": {
						"aws:Referer": "${data.aws_caller_identity.current.account_id}"
					}
				}
			},
			{
            "Sid": "AllowSSLRequestsOnly",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
             }
          }
	   ]
	}
POLICY
}