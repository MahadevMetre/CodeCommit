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

resource "aws_sns_topic" "my_sns_topic" {
	count = var.sns_subscription_bool ? 1: 0
	name = var.sns_topic_name
	tags = var.sns_topic_tags
}

resource "aws_sns_topic_subscription" "my_sns_topic_sub" {
	count = var.sns_subscription_bool ? 1: 0
	topic_arn = aws_sns_topic.my_sns_topic[0].arn
	protocol  = "sqs"
	endpoint  = aws_sqs_queue.my_sqs_queue.arn
}

resource "aws_sqs_queue_policy" "hermes2_fifo_queue_policy" {
	count = var.hermes2_email_fifo_bool ? 1: 0
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
			},
			{
				"Sid": "AllowEventBridgeToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "events.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}",
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

resource "aws_sqs_queue_policy" "my_error_queue_policy" {
	count = var.hermes2_error_queue_bool ? 1: 0
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

resource "aws_sqs_queue_policy" "hermes_serverless_dlq_policy" {
	count = var.hermes_serverless_dlq_bool ? 1: 0
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
						"aws:SourceArn": "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:rule/hermes-*"
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
						"aws:SourceArn": "arn:aws:scheduler:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:schedule/hermes-*"
					}
				}
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "hermes2_email_archive_incoming_policy" {
	count = var.hermes2_email_archive_incoming_bool ? 1: 0
	queue_url = aws_sqs_queue.my_sqs_queue.id
	policy = <<POLICY
	{
		"Version": "2012-10-17",
		"Id": "__default_policy_ID",
		"Statement": [
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
			},
			{
				"Sid": "AllowSNSToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "sns.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}",
				"Condition": {
					"ArnEquals": {
						"aws:SourceArn": "${aws_sns_topic.my_sns_topic[0].arn}"
					}
				}
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "hermes2_email_archive_error_policy" {
	count = var.hermes2_email_archive_error_bool ? 1: 0
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

resource "aws_sqs_queue_policy" "hermes2_ses_events_incoming_policy" {
	count = var.hermes2_ses_events_incoming_bool ? 1: 0
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
			},
			{
				"Sid": "AllowSNSToSendMessage",
				"Effect": "Allow",
				"Principal": {
					"Service": "sns.amazonaws.com"
				},
				"Action": "sqs:SendMessage",
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}",
				"Condition": {
					"ArnEquals": {
						"aws:SourceArn": "${aws_sns_topic.my_sns_topic[0].arn}"
					}
				}
			}
		]
	}
	POLICY
}

resource "aws_cloudwatch_event_rule" "hermes2_fifo_eb_rule" {
	count = var.hermes2_email_fifo_bool ? 1: 0
	name = var.eb_rule_name
	tags = var.eb_rule_tags
	state = "DISABLED"

	event_pattern = jsonencode(var.eb_rule_event_pattern)
	// Ignore any changes made to the variable state
	lifecycle {
		ignore_changes = [state]
	}
}

resource "aws_cloudwatch_event_target" "hermes2_fifo_eb_rule_target" {
	count = var.hermes2_email_fifo_bool ? 1: 0
	rule = aws_cloudwatch_event_rule.hermes2_fifo_eb_rule[0].name
	arn = aws_sqs_queue.my_sqs_queue.arn

	sqs_target {
		message_group_id = var.sqs_queue_name
	}

	retry_policy {
		maximum_event_age_in_seconds = 60
		maximum_retry_attempts = 0
	}

	dead_letter_config {
		arn = var.sqs_dlq_arn
	}
}