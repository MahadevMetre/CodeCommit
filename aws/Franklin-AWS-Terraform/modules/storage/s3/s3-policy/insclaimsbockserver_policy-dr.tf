resource "aws_s3_bucket_policy" "insclaimsbockserver_policy_dr" {
  count    = var.insclaimsbockserver_policy_dr ? 1 : 0
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
            "Sid": "Set permissions for object replication",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::601751840347:role/franklin-pci-to-dr-s3replication-role"
            },
            "Action": [
                "s3:ReplicateObject",
                "s3:ReplicateDelete"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*"
        },
        {
            "Sid": "Owner Permissions on replica objects",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::601751840347:root"
            },
            "Action": "s3:ObjectOwnerOverrideToBucketOwner",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*"
        },
        {
            "Sid": "Set replication permissions on replica bucket ",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::601751840347:role/franklin-pci-to-dr-s3replication-role"
            },
            "Action": [
                "s3:List*",
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}"
        }
	]
}
POLICY
}
