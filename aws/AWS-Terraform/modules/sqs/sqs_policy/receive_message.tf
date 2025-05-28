resource "aws_sqs_queue_policy" "receive_message" {
  count    = var.receive_message ? 1 : 0

  queue_url= var.sqs_queue_url
  policy =<<POLICY
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__owner_statement",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${var.root_arn}"
      },
      "Action": "SQS:*",
      "Resource": "${var.queue_arn}"
    },
    {
      "Sid": "__sender_statement",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.consumer_list)} 
      },
      "Action": "SQS:SendMessage",
      "Resource": "${var.queue_arn}"
    },
    {
      "Sid": "__receiver_statement",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.consumer_list)}
      },
      "Action": [
        "SQS:ChangeMessageVisibility",
        "SQS:DeleteMessage",
        "SQS:ReceiveMessage"
      ],
      "Resource": "${var.queue_arn}"
    }
  ]
}
POLICY
}