variable "pipe_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "source_arn" {
  type = string
}

variable "target_arn" {
  type = string
}

variable "input_template" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "log_level" {
  type = string
}

variable "include_execution_data" {
  type     = bool
  default  = false
}

variable "batch_size" {
  type  = number
}

variable "cloudwatch_logs_enabled" {
  type    = bool
  default = true
}

variable "retention_in_days" {
  type   = number
}

variable "region" {
  type   = string
}

variable "api_id" {
  type  = string
}

variable "stage" {
  type  = string
}

variable "api_path" {
  type  = string
}

variable "http_method" {
  type  = string
}

variable "source_queue_name" {
  type  = string
}

variable "api_gateway_policy_name" {
  type        = string
}

variable "sqs_policy_name" {
  type        = string
}
