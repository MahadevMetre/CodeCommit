data "aws_caller_identity" "kms_acc_id" {}
data "aws_region" "kms_region" {}

resource "aws_kms_key" "key" {
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region
  tags                     = var.tags
  // Comment out the below line policy, if using the resource aws_kms_key_policy, else uncomment and modify the data value
   //policy         = data.aws_iam_policy_document.storage-encryption-key-policy[0].json # to be updated based on which policy must be chosen 
}

resource "aws_kms_alias" "alias" {
  name          = var.alias_name
  target_key_id = aws_kms_key.key.key_id
}

resource "aws_kms_key_policy" "repo_policy" {
  count  = var.repo-kms-policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "key-consolepolicy-3",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::964190570136:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access for Key Administrators",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow use of the key",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.user_roles
        },
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "kms:GenerateDataKeyWithoutPlaintext"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_kms_key_policy" "marketing-kms-policy" {
  count  = var.marketing-kms-policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "key-consolepolicy-3",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.kms_acc_id.account_id}:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access for Key Administrators",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion",
          "kms:Sign"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_kms_key_policy" "lasso_policy" {
  count  = var.lasso-kms-policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "key-consolepolicy-3",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::data.aws_caller_identity.kms_acc_id.account_id:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access for Key Administrators",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow use of the key",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow attachment of persistent resources",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        "Resource" : "*",
        "Condition" : {
          "Bool" : {
            "kms:GrantIsForAWSResource" : "true"
          }
        }
      },
      {
        "Sid" : "Allow SES to encrypt messages using this KMS key",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ses.amazonaws.com"
        },
        "Action" : [
          "kms:Encrypt",
          "kms:GenerateDataKey*"
        ],
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "kms:EncryptionContext:aws:ses:source-account" : "data.aws_caller_identity.kms_acc_id.account_id"       # "${data.aws_caller_identity.kms_acc_id.account_id}"
          },
          "Null" : {
            "kms:EncryptionContext:aws:ses:rule-name" : "false",
            "kms:EncryptionContext:aws:ses:message-id" : "false"
          }
        }
      }
    ]
  })
}

resource "aws_kms_key_policy" "hermes_file_process_policy" {
  count  = var.hermes-file-process-policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "key-consolepolicy-3",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::data.aws_caller_identity.kms_acc_id.account_id:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access for Key Administrators",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow use of the key",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow attachment of persistent resources",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        "Resource" : "*",
        "Condition" : {
          "Bool" : {
            "kms:GrantIsForAWSResource" : "true"
          }
        }
      }
    ]
  })
}

resource "aws_kms_key_policy" "fmg_serverless_efs_policy" {
  count  = var.fmg-serverless-efs-policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "auto-elasticfilesystem-1",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.kms_acc_id.account_id}:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access for Key Administrators",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow use of the key",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.iam_roles
        },
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "Allow access to EFS for all principals in the account that are authorized to use EFS",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:CreateGrant",
          "kms:DescribeKey"
        ],
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "kms:CallerAccount" : "${data.aws_caller_identity.kms_acc_id.account_id}", 
            "kms:ViaService" : "elasticfilesystem.${data.aws_region.kms_region.name}.amazonaws.com"
          }
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "parameter-key-policy" {
  count = var.parameter_policy ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["kms:*"]
    principals {
      type        = "AWS"
      identifiers = var.iam_arn
    }
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = ["kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
    "kms:DescribeKey"]
    principals {
      type        = "AWS"
      identifiers = var.iam_roles
    }
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = ["kms:CreateGrant",
      "kms:ListGrants",
    "kms:RevokeGrant"]
    principals {
      type        = "AWS"
      identifiers = var.iam_roles
    }
    resources = ["*"]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}

data "aws_iam_policy_document" "storage-encryption-key-policy" {
  count = var.storage-encryption_policy ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["kms:*"]
    principals {
      type        = "AWS"
      identifiers = var.iam_arn
    }
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = ["kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
    "kms:DescribeKey"]
    principals {
      type        = "AWS"
      identifiers = var.iam_roles
    }
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = ["kms:CreateGrant",
      "kms:ListGrants",
    "kms:RevokeGrant"]
    principals {
      type        = "AWS"
      identifiers = var.iam_roles
    }
    resources = ["*"]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
  statement {
    effect = "Allow"
    actions = ["kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
    "kms:DescribeKey"]
    principals {
      type        = "AWS"
      identifiers = var.storage_roles
    }
    resources = ["*"]
  }
  statement {
    effect  = "Allow"
    actions = ["kms:CreateGrant"]
    principals {
      type        = "AWS"
      identifiers = var.storage_roles
    }
    resources = ["*"]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}


# rds kms key 
resource "aws_kms_key_policy" "fmg_rds_kms_policy" {
  count  = var.fmg_rds_kms_policy ? 1 : 0
  key_id = aws_kms_key.key.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Id": "auto-rds-2",
    "Statement": [
        {
            "Sid": "Allow access through RDS for all principals in the account that are authorized to use RDS",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:CreateGrant",
                "kms:ListGrants",
                "kms:DescribeKey"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "kms:ViaService": "rds.us-east-1.amazonaws.com",
                    "kms:CallerAccount": "data.aws_caller_identity.kms_acc_id.account_id"
                }
            }
        },
        {
            "Sid": "Allow direct access to key metadata to the account",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::data.aws_caller_identity.kms_acc_id.account_id:root"
            },
            "Action": [
                "kms:Describe*",
                "kms:Get*",
                "kms:List*",
                "kms:RevokeGrant"
            ],
            "Resource": "*"
        }
    ]
  })
}
