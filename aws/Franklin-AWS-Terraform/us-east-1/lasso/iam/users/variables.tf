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

variable "lasso_kms_policy" {
  type = bool
  default = false
}