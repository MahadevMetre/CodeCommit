resource "aws_s3_bucket_policy" "api-user-write-generic-dr" {
  count    = var.allow_api_user_policy_dr ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "api-user-generic-write",
    "Statement": [
        {
            "Sid": "DenyIncorrectAclForBucket",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ],
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "DenyUnEncryptedConnection",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "*",
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "DenyPublicReadACL",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": [
                        "public-read",
                        "public-read-write",
                        "authenticated-read"
                    ]
                }
            }
        },
        {
            "Sid": "DenyPublicReadGrant",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "StringLike": {
                    "s3:x-amz-grant-read": [
                        "*http://acs.amazonaws.com/groups/global/AllUsers*",
                        "*http://acs.amazonaws.com/groups/global/AuthenticatedUsers*"
                    ]
                }
            }
        },
        {
            "Sid": "DenyPublicListACL",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:PutBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": [
                        "public-read",
                        "public-read-write",
                        "authenticated-read"
                    ]
                }
            }
        },
        {
            "Sid": "DenyPublicListGrant",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:PutBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}",
            "Condition": {
                "StringLike": {
                    "s3:x-amz-grant-read": [
                        "*http://acs.amazonaws.com/groups/global/AllUsers*",
                        "*http://acs.amazonaws.com/groups/global/AuthenticatedUsers*"
                    ]
                }
            }
        },
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
