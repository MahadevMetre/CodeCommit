resource "aws_sns_topic_policy" "standard_pub_sub_sns" {
  count     = var.standard_pub_access_policy_bool ? 1 : 0
  arn       = var.sns_arn_val

  policy    =<<POLICY
{
  "Version": "2008-10-17",
  "Id": "SNS-POLICY",
  "Statement": [
    {
      "Sid": "Arcive-Event-S3-Error-SNS",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::601751840347:role/franklin-pci-processS3ArchiveEvent-lambda-role"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:us-east-1:601751840347:processS3ArchiveEvent_error_sns_pci"
    }
  ]
}
POLICY
}