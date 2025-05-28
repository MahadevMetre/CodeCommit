variable "iam_user_name" {
  type    = string
  default = ""
}

variable "iam_user_tags" {
  type = map(any)
  default = {
    "terraform" = "True"
  }
}

variable "iam_policy_name" {
  type    = string
  default = ""
}

variable "dashboard_rds_policy" {
  type    = bool
  default = false
}
