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

variable "tags" {
	description = "A map of tags to add to all resources"
	type = map
}

variable "s3_lifecycle_days" {
	description = "S3 Lifecycle expiration days"
	type = string
}

variable "noncurrent_version_expiration" {
	description = "Number of non current version to be retained"
	type = number
}

variable "noncurrent_days" {
	description = "Number of days non current version should be retained"
	type = number
}