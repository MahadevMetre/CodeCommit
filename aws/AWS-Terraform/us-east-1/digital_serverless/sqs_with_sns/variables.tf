variable "digital_email_archive_incoming_bool" {
	type = bool
	default = false
}

variable "digital_email_archive_error_bool" {
	type = bool
	default = false
}

variable "digital_ses_events_incoming_bool" {
	type = bool
	default = false
}

variable "digital_ses_events_error_bool" {
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
