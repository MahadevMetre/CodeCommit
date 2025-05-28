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

variable "iam_role_desc" {
  type = string
  default = ""
}

variable "hermes-secrets-manager-policy" {
  type = bool
  default =false
}

variable "hermes_secrets_manager_policy_arn" {
  type = string
  default = ""
}

variable "lambda_vpc_connect" {
  type = bool
  default =false
}