data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_sqs_queue" "my_sqs_queue" {
	name = var.sqs_queue_name
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

resource "aws_sqs_queue_policy" "digital_archive_ses_events_incoming_policy" {
	count = var.digital_ses_events_incoming_bool ? 1: 0
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
					"sqs:ChangeMessageVisibility"
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

resource "aws_sqs_queue_policy" "my_error_queue_policy" {
	count = var.digital_ses_events_error_bool ? 1: 0
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
					"sqs:ChangeMessageVisibility"
				],
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "digital_email_archive_error_policy" {
	count = var.digital_email_archive_error_bool ? 1: 0
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
					"sqs:ChangeMessageVisibility"
				],
				"Resource": "${aws_sqs_queue.my_sqs_queue.arn}"
			}
		]
	}
	POLICY
}

resource "aws_sqs_queue_policy" "digital_email_archive_incoming_policy" {
	count = var.digital_email_archive_incoming_bool ? 1: 0
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
					"sqs:ChangeMessageVisibility"
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