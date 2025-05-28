resource "aws_sqs_queue_policy" "delete_sqs_message" {
  count    = "${var.delete_sqs_message ? 1 : 0}"

  queue_url= "${var.sqs_queue_url}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "SQS-Security-acc-permissions",
  "Statement": [
    {
      "Sid": "Sid1577939943168",
      "Effect": "Allow",
      "Principal": {
        "AWS":  ${jsonencode(var.delete_sqs_msg_iam_arn_list)}
      },
      "Action": "SQS:SendMessage",
      "Resource": "${var.queue_arn}"
    }
  ]
}
POLICY
}
