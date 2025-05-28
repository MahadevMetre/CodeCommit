resource "aws_s3_bucket_policy" "customer_communication_policy" {
  count    = var.create_customer_communication_policy ? 1 : 0
  bucket   = "customercommunications-email-pci"
  policy =<<POLICY
{
    "Version": "2012-10-17",
	"Id": "customer_communication_policy",
    "Statement": [
        {
            "Sid": "DenyUnEncryptedConnection",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                 "${var.bucket_arn}",
                 "${var.bucket_arn}/*"
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
            "Resource":  "${var.bucket_arn}/*",
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
            "Resource":  "${var.bucket_arn}/*",
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
            "Resource":  "${var.bucket_arn}/*",
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
            "Resource":  "${var.bucket_arn}/*",
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
            "Sid": "AllowSESPuts",
            "Effect": "Allow",
            "Principal": {
                "Service": "ses.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource":  "${var.bucket_arn}/*",
            "Condition": {
                "StringEquals": {
                    "aws:Referer": "${var.aws_referer}"
                }
            }
        },
        {
            "Sid": "AllowOnlyAuthenticatedIAMUserFrmSrcIp",
            "Effect": "Allow",
            "Principal": {
                "AWS": ${jsonencode(var.allowed_ins_users_iam_arn_list)}
            },
            "Action": [
                "s3:GetObject",
                "s3:RestoreObject"
            ],
            "Resource": [
                 "${var.bucket_arn}/*",
                 "${var.bucket_arn}"
            ]
        }
    ]
}
POLICY
}