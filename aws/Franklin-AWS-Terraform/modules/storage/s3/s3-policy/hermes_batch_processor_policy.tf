resource "aws_s3_bucket_policy" "hermes_batch_processor_policy" {
  count    = var.hermes_batch_processor_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
	{
		"Version": "2012-10-17",
		"Statement": [
			{
				"Sid": "AllowOnlyJsonFilesAndFolders",
				"Effect": "Deny",
				"Principal": "*",
				"Action": "s3:PutObject",
				"NotResource": [
					"arn:aws:s3:::${var.s3_bucketName}/*.json",
					"arn:aws:s3:::${var.s3_bucketName}/*/"
				]
			}
		]
	}
POLICY
}