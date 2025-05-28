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

variable "allowed_read_only_user_list" {
  type =  list
  default = []
}

variable "event_id" {
  default=""
}

variable "events" {
  type = list(string)
  default = []
}

variable "filter_prefix" {
  default = ""
}

variable "filter_suffix" {
  default = ""
}

variable "bucket_notification_lambda_enabled" {
  type = bool
  default = false
}

variable "lambda_event_triggers" {
  type = map
  default = {
	"test" = {
		lambda_notification_function_arn = "test"
		events = ["test"]
		filter_prefix = "test"
		filter_suffix = ".test"
		event_id = "test"
	}
  }
}

variable "lambda_notification_function_arn" {
  default=""
}

variable "insclaimsbockserver_policy" {
  type = bool
  default = false
}

variable "allow_ses_put_policy" {
  type = bool
  default = false
}

variable "s3_enable_lifecycle_config" {
  type = bool
  default = false
}

variable "s3_lifecycle_days" {
	description = "S3 Lifecycle expiration days"
	default = 30
}

variable "replication" {
  type = bool
  default = false
}

variable "replication_id" {
  default = ""
}

variable "iam_role_replication_arn" {
	default = ""
}

variable "s3_destination_arn" {
	default = ""
}

variable "status" {
  default     = "Enabled"
}

variable "versioning_enabled_bool" {
  description = "A boolean that enables or disables bucket versioning"
  default     = false
}

variable "s3_eventbridge_notifications" {
  type = bool
  default = false
}