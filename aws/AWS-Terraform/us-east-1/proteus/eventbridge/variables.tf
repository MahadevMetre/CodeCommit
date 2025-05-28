variable "eb_rule_name" {
	default = ""
}

variable "tags" {
	description = "A map of tags to add to all resources"
	type = map
}

variable "schedule" {
	default = ""
}

variable "stepfunction_arn" {
	default = ""
}

variable "role" {
    type = string
}