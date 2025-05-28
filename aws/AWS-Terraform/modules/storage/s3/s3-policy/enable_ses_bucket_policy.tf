resource "aws_s3_bucket_policy" "ses_bucket_policy" {
  bucket = var.s3_bucketName

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "aws-s3-customercommunications-email-bucket-policy-qa",
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
        "Sid": "AllowBatchOperationsSourceObjectCOPY",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::634621569833:role/Franklin-Admin"
        },
        "Action": [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetObjectAcl",
          "s3:GetObjectTagging",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ],
        "Resource": "arn:aws:s3:::${var.s3_bucketName}/*"
      },
      {
        "Sid": "DenyPublicReadACL",
        "Effect": "Deny",
        "Principal": "*",
        "Action": "s3:PutObjectAcl",
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
        "Principal": "*",
        "Action": "s3:PutObject",
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
        "Principal": "*",
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
        "Principal": "*",
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
          "AWS": [
            "arn:aws:iam::634621569833:user/SES-Api-User-QA",
            "arn:aws:iam::634621569833:role/Franklin-Admin"
          ]
        },
        "Action": [
          "s3:GetObject",
          "s3:PutObject",
          "s3:RestoreObject",
          "s3:PutObjectTagging",
          "s3:ListBucket"
        ],
        "Resource": [
          "arn:aws:s3:::${var.s3_bucketName}",
          "arn:aws:s3:::${var.s3_bucketName}/*"
        ]
      },
      {
        "Sid": "InventoryAndAnalyticsExamplePolicy",
        "Effect": "Allow",
        "Principal": {
          "Service": "s3.amazonaws.com"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
        "Condition": {
          "StringEquals": {
            "s3:x-amz-acl": "bucket-owner-full-control",
            "aws:SourceAccount": "634621569833"
          },
          "ArnLike": {
            "aws:SourceArn": "arn:aws:s3:::${var.s3_bucketName}"
          }
        }
      }

    ]
  }
  POLICY
}
