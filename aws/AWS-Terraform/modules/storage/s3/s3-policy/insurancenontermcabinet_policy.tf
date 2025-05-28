resource "aws_s3_bucket_policy" "insurancenontermcabinet_policy" {
  count    = var.insurancenontermcabinet_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "aws-s3-insurancenontermcabinet-bucket-policy-qa-mr",
  "Statement": [
    {
      "Sid": "DenyUnEncryptedConnection",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "*",
      "Resource": [
        "arn:aws:s3:::insurancenontermcabinet-qa-mr",
        "arn:aws:s3:::insurancenontermcabinet-qa-mr/*"
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
      "Resource": "arn:aws:s3:::insurancenontermcabinet-qa-mr/*",
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
      "Resource": "arn:aws:s3:::insurancenontermcabinet-qa-mr/*",
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
      "Resource": "arn:aws:s3:::insurancenontermcabinet-qa-mr",
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
      "Resource": "arn:aws:s3:::insurancenontermcabinet-qa-mr",
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
        "AWS": "arn:aws:iam::894891841990:user/InsCabinet-S3-Api-User-qa"
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:RestoreObject",
        "s3:PutObjectTagging",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::insurancenontermcabinet-qa-mr",
        "arn:aws:s3:::insurancenontermcabinet-qa-mr/*"
      ]
    },
    {
      "Sid": "InventoryAndAnalyticsExamplePolicy",
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::insurancenontermcabinet-qa-mr/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control",
          "aws:SourceAccount": "702230634984"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:::insurancenontermcabinet-qa-mr"
        }
      }
    },
    {
      "Sid": "AllowDigitalPoeDelete",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::894891841990:user/Digital-PDFPOE-API-User-NonProd"
      },
      "Action": [
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::insurancenontermcabinet-qa-mr",
        "arn:aws:s3:::insurancenontermcabinet-qa-mr/*"
      ]
    }
  ]
}
POLICY
}
