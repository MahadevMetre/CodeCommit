variable "api_destination_endpoint" {
  type  = string
}

variable "connection_name" {
  type  = string
}

variable "api_destination_name" {
  type  = string
}

variable "target_id" {
  type        = string
}

variable "schedule_expression" {
  type        = string
}

variable "role_arn" {
  type        = string
}

variable "is_enabled" {
  type        = bool
}

variable "event_rule_name" {
  type        = string
}

variable "event_pattern" {
  type        = string
}

variable "description" {
  type        = string
}

variable "target_arn" {
  type        = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "invocation_http_parameters" {
  type        = map(string)
}

variable "rule_tags" {
  type = map(string)
}

variable "dlq_arn" {
  type  = string
}