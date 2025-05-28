variable "config_set_name" {
	default = ""
}

variable "config_set_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_dest_name" {
	default = ""
}

variable "event_types" {
	type = list(string)
	default = []
}

variable "sns_topic_arn" {
	default = ""
}