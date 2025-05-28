resource "aws_s3_bucket_policy" "api-user-write-generic" {
  count    = var.allow_api_user_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "api-user-generic-write",
    "Statement": [
        {
            "Sid": "AllowOnlyAuthenticatedIAMUserFrmSrcIp",
            "Effect": "Allow",
            "Principal": {
                "AWS":  ${jsonencode(var.allowed_api_user_list)}
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:RestoreObject",
                "s3:PutObjectTagging"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ]
        },
        {
            "Sid": "AllowBizUser",
            "Effect": "Allow",
            "Principal": {
                "AWS": ${jsonencode(var.allowed_read_only_user_list)}
            },
            "Action": [
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:GetBucketVersioning"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ]
        }
    ]
}
POLICY
}
