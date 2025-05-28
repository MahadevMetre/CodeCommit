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

variable "cognito_admin_policy" {
  type = bool
  default = false
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

variable "hermes_secrets_mgr_policy" {
  type = bool
  default = false
}

variable "hermes_s3_access_policy" {
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

variable "digital_ecr_docker_policy" {
  type = bool
  default = false
}


variable "admins_policy" {
  type    = bool
  default = false
}


variable "automation_qa_lead_policy" {
  type    = bool
  default = false
}

variable "leads_policy" {
  type    = bool
  default = false
}

variable "rml_policy" {
  type    = bool
  default = false
}

variable "support_ui_dev_policy" {
  type    = bool
  default = false
}

variable "ui_dev_policy" {
  type    = bool
  default = false
}

variable "region" {
  type    = string
  default = ""
}

variable "account_id" {
  type    = string
  default = ""
}

variable "repository_name" {
  type    = string
  default = ""
}
