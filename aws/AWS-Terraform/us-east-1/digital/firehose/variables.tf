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

variable "log_group_name" {
  type = string
  default = ""
}

variable "log_retention_days" {
  type = string
  default = ""
}

variable "fs_stream_name" {
  type = string
  default = ""
}

variable "ext_s3_config_custom_time_zone" {
  type = string
  default = ""
}

variable "ext_s3_config_file_extension" {
  type = string
  default = ""
}

variable "ext_s3_config_s3_backup_mode" {
  type = string
  default = ""
}

variable "ext_s3_config_buffering_size" {
  type = number
}

variable "ext_s3_config_buffering_interval" {
  type = number
}

variable "s3_backup_config_prefix" {
  type = string
  default = ""
}

variable "s3_backup_config_error_output_prefix" {
  type = string
  default = ""
}

variable "lambda_processor_buffer_size" {
  type = number
}

variable "lambda_processor_buffer_interval" {
  type = number
}

variable "fs_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

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

variable "s3b_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "role_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "role_name" {
  description = "The name of the role"
  type        = string
  default     = ""
}

variable "digital_email_tracking_policy_arn" {
  type = string
  default = ""
}

variable "iam_role_desc" {
  type = string
  default = ""
}

variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_policy_desc" {
  type = string
  default = ""
}

variable "s3_bucket_arn" {
  type = string
  default = ""
}

variable "iam_policy_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "digital_email_tracking_policy" {
  type = bool
  default = false
}

variable "lambda_function_name" {
    type = string
}

variable "lambda_role" {
    type = string
}

variable "lambda_description" {
    type = string
    default = ""
}

variable "lambda_env_variables" {
    type = map
    default = {}
}

variable "lambda_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "lambda_memory_size" {
    type = number
    default = 128
}

variable "lambda_timeout" {
    type = number
    default = 3
}

variable "lambda_runtime" {
    type = string
    default = ""
}

variable "lambda_handler" {
    type = string
    default = ""
}

variable "lambda_filename" {
    type = string
    default = ""
}

variable "lambda_package_type" {
    type = string
    default = "Zip"
}

variable "lambda_source_code_hash" {
    type = string
    default = ""
}