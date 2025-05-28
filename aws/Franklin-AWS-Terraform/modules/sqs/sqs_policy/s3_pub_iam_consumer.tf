resource "aws_sqs_queue_policy" "s3_pub_iam_consumer" {
  count    = "${var.s3_pub_iam_consumer ? 1 : 0}"

  queue_url= "${var.sqs_queue_url}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "SQS-Security-acc-permissions",
  "Statement": [
    {
      "Sid": "Allow-send-message",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${var.queue_arn}",
      "Condition": {
        "ArnLike": {
          "aws:SourceArn": ${jsonencode(var.publisher_list)}
        }
      }
    },
    {
      "Sid": "Sid1577939943168",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.consumer_list)}
      },
      "Action": [
        "SQS:ReceiveMessage",
        "SQS:DeleteMessage"
      ],
      "Resource": "${var.queue_arn}"
    }
  ]
}
POLICY
}
