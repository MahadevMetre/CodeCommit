variable "iam_user_name" {
  description = "The name of the user"
  type        = string
  default     = ""
}

variable "iam_user_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "cognito_admin_policy" {
  type = bool
  default = false
}

variable "ses_policy" {
  type = bool
  default = false
}

variable "lasso_kms_policy" {
  type = bool
  default = false
}

variable "hermes_archival_process_policy" {
  type = bool
  default = false
}

variable "hermes_file_process_policy" {
  type = bool
  default = false
}

variable "hermes_file_integration_policy" {
  type = bool
  default = false
}

variable "pycharm_aws_user_policy" {
  type = bool
  default = false
}

variable "proteus_s3_access_policy" {
  type = bool
  default = false
}