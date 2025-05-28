variable "fifo_queue_bool" {
	type = bool
	default = false
}

variable "digital_incoming_fifo_bool" {
	type = bool
	default = false
}

variable "digital_error_queue_bool" {
	type = bool
	default = false
}

variable "sqs_user_arn" {
	default = ""
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

variable "sqs_dlq_arn" {
	default = ""
}

variable "digital_serverless_dlq_bool" {
	type = bool
	default = false
}
