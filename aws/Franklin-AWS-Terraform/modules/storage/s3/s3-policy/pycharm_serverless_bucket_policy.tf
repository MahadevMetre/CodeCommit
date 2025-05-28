resource "aws_s3_bucket_policy" "pycharm_serverless_bucket_policy" {
  count    = var.pycharm_serverless_bucket_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
	{
		"Version": "2012-10-17",
		"Statement": [
			{
				"Sid": "AllowOnlyJsonFilesPDFFilesAndFolders",
				"Effect": "Deny",
				"Principal": "*",
				"Action": "s3:PutObject",
				"NotResource": [
					"arn:aws:s3:::${var.s3_bucketName}/*.json",
					"arn:aws:s3:::${var.s3_bucketName}/*.pdf",
					"arn:aws:s3:::${var.s3_bucketName}/*.PDF",
					"arn:aws:s3:::${var.s3_bucketName}/*/"
				]
			}
		]
	}
POLICY
}