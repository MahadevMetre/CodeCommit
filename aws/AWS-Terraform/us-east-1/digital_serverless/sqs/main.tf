data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_sqs_queue" "my_sqs_queue" {
	name = var.sqs_queue_name
	fifo_queue = var.fifo_queue_bool
	content_based_deduplication = var.fifo_queue_bool == true ? true : false
	visibility_timeout_seconds = var.visibility_timeout_seconds
	sqs_managed_sse_enabled = true
	tags = var.sqs_queue_tags
}


resource "aws_sqs_queue_policy" "digital_fifo_queue_policy" {
	count = var.digital_incoming_fifo_bool ? 1: 0
	queue_url = aws_sqs_queue.my_sqs_queue.id
	policy = <<POLICY
	{
		"Version": "2012-10-17",
		"Id": "__default_policy_ID",
		"Statement": [
			{
				"Sid": "__owner_statement",
				"Effect": "Allow",
				"Principal": {
					"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
				},
				"Action": "sqs:*",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			},
			{
				"Sid": "AllowSQSUser",
				"Effect": "Allow",
				"Principal": {
					"AWS": "${var.sqs_user_arn}"
				},
				"Action": [
					"sqs:DeleteMessage",
					"sqs:ReceiveMessage",
					"sqs:SendMessage",
					"sqs:ChangeMessageVisibility",
					"sqs:GetQueueAttributes"
				],
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "my_error_queue_policy" {
	count = var.digital_error_queue_bool ? 1: 0
	queue_url = aws_sqs_queue.my_sqs_queue.id
	policy = <<POLICY
	{
		"Version": "2012-10-17",
		"Id": "__default_policy_ID",
		"Statement": [
			{
				"Sid": "__owner_statement",
				"Effect": "Allow",
				"Principal": {
					"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
				},
				"Action": "sqs:*",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			},
			{
				"Sid": "AllowSQSUser",
				"Effect": "Allow",
				"Principal": {
					"AWS": "${var.sqs_user_arn}"
				},
				"Action": [
					"sqs:DeleteMessage",
					"sqs:ReceiveMessage",
					"sqs:SendMessage",
					"sqs:ChangeMessageVisibility",
					"sqs:GetQueueAttributes"
				],
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "digital_serverless_dlq_policy" {
	count = var.digital_serverless_dlq_bool ? 1: 0
	queue_url = aws_sqs_queue.my_sqs_queue.id
	policy = <<POLICY
	{
		"Version": "2012-10-17",
		"Id": "__default_policy_ID",
		"Statement": [
			{
				"Sid": "__owner_statement",
				"Effect": "Allow",
				"Principal": {
					"AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
				},
				"Action": "sqs:*",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			},
			{
				"Sid": "AllowEventBridgeRulesToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "events.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}",
				"Condition": {
					"ArnLike": {
						"aws:SourceArn": "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:rule/digital-*"
					}
				}
			},
			{
				"Sid": "AllowEventBridgeSchedulesToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "scheduler.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}",
				"Condition": {
					"ArnLike": {
						"aws:SourceArn": "arn:aws:scheduler:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:schedule/digital-*"
					}
				}
			}
		]
	}
	POLICY
}
