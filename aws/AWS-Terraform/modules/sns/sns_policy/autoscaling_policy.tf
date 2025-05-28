resource "aws_sns_topic_policy" "autoscaling_policy_sns" {
  count     = var.autoscaling_policy ? 1 : 0
  arn       = var.sns_arn_val

  policy    =<<POLICY
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Resource": "${var.sns_arn_val}",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "${var.source_owner}"
        }
      }
    }
  ]
}
POLICY
}