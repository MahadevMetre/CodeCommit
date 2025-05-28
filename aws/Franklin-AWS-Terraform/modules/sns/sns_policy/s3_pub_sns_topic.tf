resource "aws_sns_topic_policy" "policy_sns" {
  count     = var.standard_s3_pub_access_policy ? 1 : 0
  arn       = var.sns_arn_val

  policy    =<<POLICY
{
  "Version": "2008-10-17",
  "Id": "SNS-POLICY",
  "Statement": [
    {
      "Sid": "Arcive-Event-S3",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SNS:Publish",
      "Resource": var.sns_arn_val,
      "Condition": {
        "ArnLike": {
          "aws:SourceArn": ${jsonencode(var.s3_bucket_arn_list)}
        }
      }
    }
  ]
}
POLICY
}