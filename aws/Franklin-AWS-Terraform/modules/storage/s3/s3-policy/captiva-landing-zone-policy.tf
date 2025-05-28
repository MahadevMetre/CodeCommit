resource "aws_s3_bucket_policy" "captiva_landing_zone_bucket" {
  count    = var.create_captiva_landing_zone_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "aws-s3-insuranceclaimscabinet-bucket-policy-dev",
    "Statement": [
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
                "AWS":  ${jsonencode(var.allowed_captiva_user_iam_arn_list)}
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
            "Sid": "AllowOnlyAuthenticatedIAMUserFrmSrcIp",
            "Effect": "Allow",
            "Principal": {
                "AWS":  ${jsonencode(var.allowed_ins_users_iam_arn_list)}
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}/CLAIMS/*",
                "arn:aws:s3:::${var.s3_bucketName}/TERM/*",
                "arn:aws:s3:::${var.s3_bucketName}/NON-TERM/*"
            ]
        },
        {
            "Sid": "IPDeny",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "StringNotEquals": {
                    "aws:sourceVpce": ${jsonencode(var.s3_vpc_endpoint)}
                }
            }
        }
    ]
}
POLICY
}
