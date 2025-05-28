variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "cloudfront-sg-update-policy" {
  type = bool
  default = false
}

variable "role_tags" {
  description = "A map of tags to add to all resources"
  type = map
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
  type = bool
  default = false
}

variable "cognito-bool" {
  type = bool
  default = false
}

variable "cognito-admin-policy" {
  type = bool
  default = false
}

variable "ip-unauth-policy" {
  type = bool
  default = false
}

variable "ip-auth-policy" {
  type = bool
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
  type = bool
  default = false
}

variable "marketing-inline-policy" {
  type = bool
  default =false
}

variable "lambda_execution" {
  type = bool
  default =false
}

variable "lambda_vpc_connect" {
  type = bool
  default =false
}

variable "api_gtwy_cloudwatch_attach" {
  type = bool
  default =false
}

variable "user_group_policy" {
  type = bool
  default =false
}

variable "iam_role_desc" {
  type = string
  default = ""
}

variable "AWSLambdaVPCAccessExecutionRole" {
  type = bool
  default =false
}

variable "SecretsManagerReadWrite" {
  type = bool
  default =false
}

variable "lambda-invoke-policy" {
  type = bool
  default =false
}

variable "lambda_invoke_policy_arn" {
  type = string
  default = ""
}

variable "lasso-logger-policy" {
  type = bool
  default =false
}

variable "lasso_logger_policy_arn" {
  type = string
  default = ""
}

variable "lasso-rds-proxy-policy" {
  type = bool
  default =false
}

variable "lasso_rds_proxy_policy_arn" {
  type = string
  default = ""
}

variable "lasso-s3-access-policy" {
  type = bool
  default =false
}

variable "lasso_s3_access_policy_arn" {
  type = string
  default = ""
}

variable "lasso-secrets-manager-policy" {
  type = bool
  default =false
}

variable "lasso_secrets_manager_policy_arn" {
  type = string
  default = ""
}

variable "lasso-vpc-access-policy" {
  type = bool
  default =false
}

variable "lasso_vpc_access_policy_arn" {
  type = string
  default = ""
}

variable "ses-access-policy" {
  type = bool
  default =false
}

variable "ses_access_policy_arn" {
  type = string
  default = ""
}

variable "eventbridge_scheduler_source_arn" {
  type = string
  default = ""
}

variable "fmg-dw-redshift_policy" { 
  type = string
  default = ""
}

variable "fmg-dw-redshift_policy_arn" { 
  type = string
  default = ""
}

variable "proteus-etl-secrets" { 
  type = string
  default = ""
}

variable "proteus-etl-secrets_arn" { 
  type = string
  default = ""
}

variable "proteus-redshift-scheduler" { 
  type = string
  default = ""
}

variable "proteus-redshift-scheduler_arn" { 
  type = string
  default = ""
}

variable "fmg-dw-eventbridge-policy" { 
  type = string
  default = ""
}

variable "fmg-dw-eventbridge-policy_arn" { 
  type = string
  default = ""
}

variable "proteus2_acxiom_olmb_lambda_policy" { 
  type = bool
  default = false
}

variable "proteus2_acxiom_olmb_lambda_policy_arn" { 
  type = string
  default = ""
}

variable "proteus2_kms_policy_arn" { 
  type = string
  default = ""
}

variable "proteus2_kms_policy" { 
  type = bool
  default = false
}
