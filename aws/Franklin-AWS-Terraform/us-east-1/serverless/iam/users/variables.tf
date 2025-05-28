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