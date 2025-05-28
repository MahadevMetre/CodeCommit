resource "aws_s3_bucket_policy" "replication_dr" {
  count    = var.replication_policy_dr ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "api-user-generic-write",
    "Statement": [
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