variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_policy_desc" {
  type    = string
  default = ""
}

variable "iam_policy_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default = {
    "terraform" = "True"
  }
}

variable "dashboard_rds_dbuser_arn" {
  type    = string
  default = ""
}
variable "bucket_env" {
  type    = string
  default = ""
}

variable "dashboard_rds_policy" {
  type    = string
  default = ""
}

