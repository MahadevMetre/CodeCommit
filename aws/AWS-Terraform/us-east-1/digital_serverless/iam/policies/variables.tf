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

variable "marketing-dynamodb-policy" {
  type = bool
  default = false
}

variable "marketing_kms_policy" {
  type = bool
  default = false
}

variable "secrets_name" {
  type    = string
  default = ""
}

variable "digital-serverless-ses" {
  type = bool
  default =false
}
variable "iam_role_id" {
  type    = string
  default = ""
}

variable "Cloud-front-digital-sg-update-lambda-policy" {
  type    = bool
  default = false
}

variable "digital_serverless_parameter_store_policy" {
  type    = bool
  default = false
}

variable "digital-admin-cognito-policy" {
  type    = bool
  default = false
}

variable "digital-lambda-InlinePolicy" {
  type    = bool
  default = false
}

variable "digital-cognito-up-sms-policy" {
  type    = bool
  default = false
}