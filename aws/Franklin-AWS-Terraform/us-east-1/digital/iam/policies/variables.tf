variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_policy_desc" {
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

variable "digital_logger_policy" {
  type = bool
  default = false
}

variable "digital_log_group_arn" {
  type = string
  default = ""
}

variable "digital_secrets_mgr_policy" {
  type = bool
  default = false
}

variable "digital_vpc_access_policy" {
  type = bool
  default = false
}

variable "lambda_invoke_policy" {
  type = bool
  default = false
}

variable "digital_ecr_docker_policy" {
  type = bool
  default = false
}
