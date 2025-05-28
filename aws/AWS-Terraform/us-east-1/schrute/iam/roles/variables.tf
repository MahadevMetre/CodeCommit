variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
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

variable "iam_role_desc" {
  type = string
  default = ""
}

variable "lambda-invoke-policy" {
  type = bool
  default =false
}

variable "lambda_invoke_policy_arn" {
  type = string
  default = ""
}

variable "digital-logger-policy" {
  type = bool
  default =false
}

variable "digital_logger_policy_arn" {
  type = string
  default = ""
}

variable "digital-secrets-manager-policy" {
  type = bool
  default =false
}

variable "digital_secrets_manager_policy_arn" {
  type = string
  default = ""
}

variable "digital-vpc-access-policy" {
  type = bool
  default =false
}

variable "digital_vpc_access_policy_arn" {
  type = string
  default = ""
}

variable "digital-ecr-docker-policy" {
  type = bool
  default =false
}

variable "digital_ecr_docker_policy_arn" {
  type = string
  default = ""
}

variable "eventbridge_scheduler_source_arn" {
  type = string
  default = ""
}

variable "marketing-vanity-lambda-policy" {
  type = bool
  default =false
}

variable "s3_bucket_name" {
  type    = string
  default = ""
}

variable "secrets_name" {
  type    = string
  default = ""
}

variable "marketing-dynamodb-policy" {
  type = bool
  default =false
}

variable "marketing_dynamodb_policy_arn" {
  type = string
  default = ""
}

variable "marketing_kms_policy" {
  type = bool
  default =false
}

variable "marketing_kms_policy_arn" {
  type = string
  default = ""
}

variable "kms_key" {
  type    = string
  default = ""
}

variable "digital-serverless-parameter" {
  type = bool
  default =false
}

variable "Cloud-front-digital-sg-update-lambda-policy_arn" {
  type = string
  default = ""
}

variable "Cloud-front-digital-sg-update-lambda-policy" {
  type = bool
  default =false
}

variable "digital-cognito-up-sms-policy" {
  type = bool
  default =false
}

variable "digital-cognito-up-sms-policy_arn" {
  type = string
  default = ""
}