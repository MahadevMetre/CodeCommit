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

variable "lasso_logger_policy" {
  type = bool
  default = false
}

variable "lasso_log_group_arn" {
  type = string
  default = ""
}

variable "lasso_rds_proxy_policy" {
  type = bool
  default = false
}

variable "lasso_rds_dbuser_arn" {
  type = string
  default = ""
}

variable "lasso_s3_access_policy" {
  type = bool
  default = false
}

variable "bucket_env" {
  type = string
  default = ""
}

variable "lasso_secrets_mgr_policy" {
  type = bool
  default = false
}

variable "lasso_vpc_access_policy" {
  type = bool
  default = false
}

variable "lambda_invoke_policy" {
  type = bool
  default = false
}

variable "ses_access_policy" {
  type = bool
  default = false
}

variable "lasso_kms_policy" {
  type = bool
  default = false
}