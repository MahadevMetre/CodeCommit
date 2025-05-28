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

variable "logging"{
  default = []
  type = list
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

variable "versioning_enabled_bool" {
  description = "A boolean that enables or disables bucket versioning"
  default     = false
}

variable "mfa_delete" {
  description = "A boolean that Enable MFA"
  default     = false
}

variable "lifecycle_enabled_bool" {
  description = "A boolean that enables lifecycle"
  default     = false
}

variable "lifecycle_tags" {
  description = "A map of tags to specify lifecycle parameters"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "lifecycle_transition_days" {
  default = 1
}

variable "lifecycle_storage_class" {
  default = "GLACIER"
}

variable "lifecycle_id" {
  default = ""
}

variable "lifecycle_prefix"{
  default = ""
}

variable "aws_referer" {
	default = ""
}

variable "bucket_arn" {
	default = ""
}

variable "fmservice_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "fmservice_vanity_biz_user_arn" {
	default = ""
}

variable "create_fmservice_vanity_iam_user" {
  type = bool
  default = false
}

variable "iam_user_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "enforce_bucket_owner" {
  type = bool
  default = false
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

variable "event_id" {
  default=""
}

variable "marketing_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "marketing_vanity_allowed_users_list"{
  type =  list
  default = []
}