resource "aws_s3_bucket_policy" "marketing_vanity_bucket_policy" {
  count    = var.marketing_vanity_bucket_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "aws-s3-marketing-vanity-policy",
    "Statement": [
        {
            "Sid": "AllowCrushFTPUserPut",
            "Effect": "Allow",
            "Principal": {
                "AWS": ${jsonencode(var.marketing_vanity_allowed_users_list)}
            },
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:GetObjectTagging",
                "s3:ListMultipartUploadParts",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/marketing/upsell/incoming/*.xlsx"
        },
        {
            "Sid": "AllowCrushFTPUserList",
            "Effect": "Allow",
            "Principal": {
                "AWS": ${jsonencode(var.marketing_vanity_allowed_users_list)}
            },
            "Action": [
                "s3:ListBucket",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}"
        },
        {
            "Sid": "DenyNonxlsxFiles",
            "Effect": "Deny",
            "Principal": "*",
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:ListMultipartUploadParts",
                "s3:PutObject"
            ],
            "NotResource": [
                "arn:aws:s3:::${var.s3_bucketName}/marketing/upsell/incoming/",
                "arn:aws:s3:::${var.s3_bucketName}/marketing/upsell/error/*.xlsx",
                "arn:aws:s3:::${var.s3_bucketName}/marketing/upsell/incoming/*.xlsx",
                "arn:aws:s3:::${var.s3_bucketName}/marketing/upsell/processed/*.xlsx"
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