variable "ses_domain_name" {
  type = string
}

variable "iam_user_arn" {
  type = string
}

variable "ses_sending_policy_name" {
  type = string
}

variable attach_ses_policy {
 type = bool
 default = false
}