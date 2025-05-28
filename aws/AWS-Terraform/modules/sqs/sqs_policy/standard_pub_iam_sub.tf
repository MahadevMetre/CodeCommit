resource "aws_sqs_queue_policy" "standard_policy_sqs" {
  count    = "${var.standard_pub_iam_sub ? 1 : 0}"

  queue_url= "${var.sqs_queue_url}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "lambda_publish_archive_functionality_delete",
  "Statement": [
    {
      "Sid": "Sid1583303836941",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.publisher_list)}
      },
      "Action": "SQS:SendMessage",
      "Resource": "${var.queue_arn}"
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
      "Resource":  "${var.queue_arn}"
    }
  ]
}
POLICY
}