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

variable "attach_apigw_permission" {
    type = bool
    default = false
}

variable "apigw_arn" {
    type = string 
    default = ""
}

variable "attach_sns_permission" {
    type = bool
    default = false
}

variable "attach_s3_permission" {
    type = bool
    default = false
}

variable "s3_bucket_statement_id" {
    type = string 
    default = "lambda-s3-trigger"
}

variable "s3_bucket_account_id" {
    type = string 
    default = ""
}

variable "s3_bucket_arn" {
    type = string 
    default = ""
}

variable "lasso_integration_schedules" {
    type = bool
    default = false
}

variable "lasso_integration_schedule_env" {
    type = string
    default = "noenv"
}

variable "schedule_group_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}