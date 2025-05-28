variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "cloudfront-sg-update-policy" {
  type    = bool
  default = false
}

variable "role_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default = {
    "terraform" = "True"
  }
}

variable "role_name" {
  description = "The name of the role"
  type        = string
  default     = ""
}

variable "lambda-bool" {
  type    = bool
  default = false
}

variable "cognito-bool" {
  type    = bool
  default = false
}

variable "cognito-admin-policy" {
  type    = bool
  default = false
}

variable "ip-unauth-policy" {
  type    = bool
  default = false
}

variable "ip-auth-policy" {
  type    = bool
  default = false
}

variable "parameter_arn" {
  description = "List of all ARNs that are to be authorized"
  type        = list(string)
  default     = []
}

variable "sqs_arn_val" {
  description = "SQS Queue to which messages has to be posted"
  type        = string
  default     = ""
}

variable "lambda-inline-policy" {
  type    = bool
  default = false
}

variable "marketing-inline-policy" {
  type    = bool
  default = false
}

variable "lambda_execution" {
  type    = bool
  default = false
}

variable "lambda_vpc_connect" {
  type    = bool
  default = false
}

variable "api_gtwy_cloudwatch_attach" {
  type    = bool
  default = false
}

variable "user_group_policy" {
  type    = bool
  default = false
}

variable "iam_role_desc" {
  type    = string
  default = ""
}

variable "AWSLambdaVPCAccessExecutionRole" {
  type    = bool
  default = false
}

variable "SecretsManagerReadWrite" {
  type    = bool
  default = false
}

variable "lambda-invoke-policy" {
  type    = bool
  default = false
}

variable "lambda_invoke_policy_arn" {
  type    = string
  default = ""
}

variable "lasso-logger-policy" {
  type    = bool
  default = false
}

variable "lasso_logger_policy_arn" {
  type    = string
  default = ""
}

variable "lasso-rds-proxy-policy" {
  type    = bool
  default = false
}

variable "lasso_rds_proxy_policy_arn" {
  type    = string
  default = ""
}

variable "lasso-s3-access-policy" {
  type    = bool
  default = false
}

variable "lasso_s3_access_policy_arn" {
  type    = string
  default = ""
}

variable "lasso-secrets-manager-policy" {
  type    = bool
  default = false
}

variable "lasso_secrets_manager_policy_arn" {
  type    = string
  default = ""
}

variable "lasso-vpc-access-policy" {
  type    = bool
  default = false
}

variable "lasso_vpc_access_policy_arn" {
  type    = string
  default = ""
}

variable "ec2-start-stop-policy" {
  type    = bool
  default = false
}

variable "ses-access-policy" {
  type    = bool
  default = false
}

variable "ses_access_policy_arn" {
  type    = string
  default = ""
}

variable "eventbridge_scheduler_source_arn" {
  type    = string
  default = ""
}

variable "hermes-job-launcher-role-policy" {
  type    = bool
  default = false
}

variable "batch-job-launcher-role-policy" {
  type    = bool
  default = false
}

variable "hermes-secrets-manager-policy" {
  type    = bool
  default = false
}

variable "hermes_secrets_manager_policy_arn" {
  type    = string
  default = ""
}

variable "digital-secrets-manager-policy" {
  type    = bool
  default = false
}

variable "digital_secrets_manager_policy_arn" {
  type    = string
  default = ""
}

variable "digital-vpc-access-policy" {
  type    = bool
  default = false
}

variable "digital_vpc_access_policy_arn" {
  type    = string
  default = ""
}

variable "digital-logger-policy" {
  type    = bool
  default = false
}

variable "digital_logger_policy_arn" {
  type    = string
  default = ""
}

variable "digital-ecr-docker-policy" {
  type    = bool
  default = false
}

variable "digital_ecr_docker_policy_arn" {
  type    = string
  default = ""
}

variable "admins_policy" {
  type    = bool
  default = false
}

variable "admins_policy_arn" {
  type    = string
  default = ""
}

variable "automation_qa_lead_policy" {
  type    = bool
  default = false
}

variable "automation_qa_lead_policy_arn" {
  type    = string
  default = ""
}

variable "leads_policy" {
  type    = bool
  default = false
}

variable "leads_policy_arn" {
  type    = string
  default = ""
}

variable "rml_policy" {
  type    = bool
  default = false
}

variable "rml_policy_arn" {
  type    = string
  default = ""
}

variable "support_ui_dev_policy" {
  type    = bool
  default = false
}

variable "support_ui_dev_policy_arn" {
  type    = string
  default = ""
}

variable "ui_dev_policy" {
  type    = bool
  default = false
}

variable "ui_dev_policy_arn" {
  type    = string
  default = ""
}