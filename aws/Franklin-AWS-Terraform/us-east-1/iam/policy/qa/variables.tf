variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_policy_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "cognito_admin_policy" {
  type = bool
  default = false
}