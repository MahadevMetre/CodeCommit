data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_scheduler_schedule_group" "hermes_serverless" {
	count	= var.create_schedule_group ? 1: 0
	name	= var.schedule_group_name
	tags	= var.schedule_group_tags
}

resource "aws_sqs_queue" "my_sqs_queue" {
	count = var.create_sqs_queue ? 1: 0
	name = var.sqs_queue_name
	fifo_queue = true
	content_based_deduplication = true
	visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
	sqs_managed_sse_enabled = true
	tags = var.sqs_queue_tags
}

resource "aws_sqs_queue_policy" "my_sqs_queue_policy" {
	count = var.create_sqs_queue ? 1: 0
	queue_url = aws_sqs_queue.my_sqs_queue[0].id
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
				"Resource": "${aws_sqs_queue.my_sqs_queue[0].arn}"
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
					"sqs:ChangeMessageVisibility"
				],
				"Resource": "${aws_sqs_queue.my_sqs_queue[0].arn}"
			},
			{
				"Sid": "AllowEventBridgeToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "events.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue[0].arn}",
				"Condition": {
					"ArnLike": {
						"aws:SourceArn": "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:rule/hermes-*"
					}
				}
			}
		]
	}
	POLICY
}