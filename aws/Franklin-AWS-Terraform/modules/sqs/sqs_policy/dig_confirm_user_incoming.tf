resource "aws_sqs_queue_policy" "dig_confirm_user_incoming" {
  count    = var.dig_confirm_user_incoming ? 1 : 0

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
      "Sid": "Lambda_Post_message",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode(var.publisher_list)} 
      },
      "Action": "SQS:SendMessage",
      "Resource": "${var.queue_arn}"
    },
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
    }
  ]
}
POLICY
}