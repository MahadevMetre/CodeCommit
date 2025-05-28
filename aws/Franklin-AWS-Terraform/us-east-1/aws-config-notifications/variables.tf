variable "project_name" {
	description = "Name of the Project"
	type = string
}

variable "env" {
	description = "Development environment"
	type = string
}

variable "lambda_desc" {
	description = "lambda description"
	type = string
}

variable "lambda_memory" {
	description = "lambda memory size"
	type = number
}

variable "lambda_runtime" {
	description = "lambda runtime"
	type = string
}

variable "lambda_timeout" {
	description = "lambda execution timeout"
	type = number
}

variable "lambda_env_variables" {
	description = "A map of tags to add to all resources"
	type = map
}

variable "tags" {
	description = "A map of tags to add to all resources"
	type = map
}

variable "create_sns_topic" {
    type = bool
    default = false
}