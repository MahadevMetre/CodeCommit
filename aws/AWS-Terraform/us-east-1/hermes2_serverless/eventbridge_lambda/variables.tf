variable "hermes_address_correction_bool" {
    type = bool
    default = false
}

variable "hermes_archival_api_bool" {
    type = bool
    default = false
}

variable "hermes_email_analytics_bool" {
    type = bool
    default = false
}

variable "hermes_email_archival_cuscommupload_api_bool" {
    type = bool
    default = false
}

variable "hermes_email_transformer_api_bool" {
    type = bool
    default = false
}

variable "hermes_file_processing_api_bool" {
    type = bool
    default = false
}

variable "hermes_kibana_count_api_bool" {
    type = bool
    default = false
}

variable "hermes_payload_cleanup_api_bool" {
    type = bool
    default = false
}

variable "lambda_function_name" {
    type = string
}

variable "role" {
    type = string
}

variable "description" {
    type = string
    default = ""
}

variable "env_variables" {
    type = map
    default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "memory_size" {
    type = number
    default = 128
}

variable "ephemeral_storage_size" {
    type = number
    default = 512
}

variable "timeout" {
    type = number
    default = 3
}

variable "subnets" {
    type = list(string)
    default = []
}

variable "security_groups" {
    type = list(string)
    default = []
}

variable "reserved_concurrent_executions" {
    type = number 
    default = -1
}

variable "publish" {
    type = bool
    default = false
}

variable "runtime" {
    type = string
    default = ""
}

variable "handler" {
    type = string
    default = ""
}

variable "filename" {
    type = string
    default = ""
}

variable "package_type" {
    type = string 
    default = "Zip"
}

variable "source_code_hash" {
    type = string 
    default = ""
}

variable "layers" {
    type = list(string)
    default = []
}

variable "snap_start_apply_on" {
    type = string 
    default = "None"
}

variable "schedule_group_name" {
	default = ""
}

variable "schedule_name" {
	default = ""
}

variable "schedule2_name" {
	default = ""
}

variable "schedule_target_role_arn" {
	default = ""
}

variable "eb_rule_name" {
	default = ""
}

variable "eb_rule_event_pattern" {
	default = {}
}

variable "eb_rule_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "sqs_dlq_arn" {
	default = ""
}