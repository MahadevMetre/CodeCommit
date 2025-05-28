variable "bucket_name" {
	default = ""
}

variable "s3_lifecycle_days" {
	description = "S3 Lifecycle expiration days"
	default = 30
}

variable "noncurrent_version_expiration" {
	description = "Number of non current version to be retained"
	type = number
	default = 1
}

variable "noncurrent_days" {
	description = "Number of days non current version should be retained"
	type = number
	default = 30
}
