resource "aws_s3_bucket_policy" "fmservice_vanity_bucket_policy" {
  count    = var.fmservice_vanity_bucket_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "aws-s3-digital-vanity-policy",
    "Statement": [
        {
            "Sid": "AllowDigitalBizUser",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.fmservice_vanity_biz_user_arn}"
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:RestoreObject",
                "s3:PutObjectTagging",
                "s3:DeleteObject",
                "s3:GetBucketVersioning"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/Vanity_*.xlsx"
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