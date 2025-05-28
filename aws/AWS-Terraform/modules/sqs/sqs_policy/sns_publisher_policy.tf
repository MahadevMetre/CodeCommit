resource "aws_sqs_queue_policy" "sns_publisher_policy" {
  count    = "${var.sns_publisher_policy ? 1 : 0}"

  queue_url= "${var.sqs_queue_url}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1605530024745",
  "Statement": [
    {
      "Sid": "Stmt1605530022187",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.consumer_list)}
      },
      "Action": [
        "SQS:ChangeMessageVisibility",
        "SQS:DeleteMessage",
        "SQS:ReceiveMessage",
        "SQS:SendMessage"
      ],
      "Resource": "${var.queue_arn}"
    },
    {
      "Sid": "Allow-SNS-SendMessage",
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sqs:SendMessage",
      "Resource": "${var.queue_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": ${jsonencode(var.publisher_list)}
        }
      }
    }
  ]
}
POLICY
}