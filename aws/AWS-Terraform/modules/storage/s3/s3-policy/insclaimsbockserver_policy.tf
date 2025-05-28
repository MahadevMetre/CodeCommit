resource "aws_s3_bucket_policy" "insclaimsbockserver_policy" {
  count    = var.insclaimsbockserver_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
	{
		"Version": "2012-10-17",
		"Id": "aws-s3-insurance-claims-bock-server-policy",
		"Statement": [
			{
				"Sid": "AllowLassoBizUser",
				"Effect": "Allow",
				"Principal": {
					"AWS": ${jsonencode(var.allowed_read_only_user_list)}
				},
				"Action": [
					"s3:GetObject",
					"s3:PutObject",
					"s3:ListBucket",
					"s3:ListBucketVersions",
					"s3:RestoreObject",
					"s3:PutObjectTagging",
					"s3:DeleteObject"
				],
				"Resource": [
					"arn:aws:s3:::${var.s3_bucketName}",
					"arn:aws:s3:::${var.s3_bucketName}/*/*Printed*/",
					"arn:aws:s3:::${var.s3_bucketName}/*.pdf",
					"arn:aws:s3:::${var.s3_bucketName}/*.PDF",
					"arn:aws:s3:::${var.s3_bucketName}/*.tif",
					"arn:aws:s3:::${var.s3_bucketName}/*.TIF",
					"arn:aws:s3:::${var.s3_bucketName}/*.tiff",
					"arn:aws:s3:::${var.s3_bucketName}/*.TIFF"
				]
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