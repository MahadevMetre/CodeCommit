variable "fifo_queue_bool" {
	type = bool
	default = false
}

variable "hermes_serverless_dlq_bool" {
	type = bool
	default = false
}

variable "hermes2_email_archive_incoming_bool" {
	type = bool
	default = false
}

variable "hermes2_email_archive_error_bool" {
	type = bool
	default = false
}

variable "hermes2_email_fifo_bool" {
	type = bool
	default = false
}

variable "hermes2_ses_events_incoming_bool" {
	type = bool
	default = false
}

variable "hermes2_error_queue_bool" {
	type = bool
	default = false
}

variable "sqs_user_arn" {
	default = ""
}

variable "sns_subscription_bool" {
	type = bool
	default = false
}

variable "sqs_queue_name" {
	default = ""
}

variable "visibility_timeout_seconds" {
	default = 30
}

variable "sqs_queue_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "sns_topic_name" {
	default = ""
}

variable "sns_topic_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name" {
	default = ""
}

variable "eb_rule_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_event_pattern" {
	default = {}
}

variable "sqs_dlq_arn" {
	default = ""
}