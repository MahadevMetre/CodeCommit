resource "aws_s3_bucket_policy" "alb_access_log" {
  count    = var.alb_access_log_policy ? 1 : 0
  bucket   = var.s3_bucketName
  policy =<<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1631724868952",
    "Statement": [
        {
            "Sid": "AWSConsoleStmt-1631724868954",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::127311923021:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.nginx_alb}/AWSLogs/${var.aws_referer}/*"
        },
        {
            "Sid": "AWSConsoleStmt-1631724868954",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::127311923021:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.jboss_alb}/AWSLogs/${var.aws_referer}/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.nginx_alb}/AWSLogs/${var.aws_referer}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": [
                        "bucket-owner-full-control"
                    ]
                }
            }
        },
        {
            "Sid": "AWSConsoleStmt-1631724868954",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::127311923021:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.dig_jboss_alb}/AWSLogs/${var.aws_referer}/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.dig_jboss_nlb}/AWSLogs/${var.aws_referer}/*"
        },
        {
            "Sid": "AWSConsoleStmt-1631724868954",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::127311923021:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/${var.dig_nginx_alb}/AWSLogs/${var.aws_referer}/*"
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}"
        }
    ]
}
POLICY
}