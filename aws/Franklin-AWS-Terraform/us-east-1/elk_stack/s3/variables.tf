variable "bucket_short_name" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  default= ""
}

variable "logging_bucket_name" {
  default=""
}

variable "logging_bucket_base_prefix"{
  default = ""
}

variable "environment" {
  default = ""
}

variable "acl" {
  description = "The canned ACL to apply"
  default = "private"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "s3_enable_lifecycle_config" {
  type = bool
  default = false
}

variable "s3_lifecycle_days" {
	description = "S3 Lifecycle expiration days"
	default = 30
}