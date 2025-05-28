variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "cloudfront-sg-update-policy" {
  type    = bool
  default = false
}

variable "iam_role_id" {
  type    = string
  default = ""
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

variable "user_group_policy" {
  type    = bool
  default = false
}

variable "ec2-start-stop-policy" {
  type    = bool
  default = false
}

variable "hermes-job-launcher-role-policy" {
  type    = bool
  default = false
}

variable "batch-job-launcher-role-policy" {
  type    = bool
  default = false
}

variable "baseline_over_rides_s3" {
  type    = bool
  default = false
}

variable "statement_id" {
  description = "The statement ID of the policy"
  type        = string
  default     = ""
}

variable "policy_effects" {
  description = "List of all effects that are to be authorized"
  type        = string
  default     = "Deny"
}

variable "actions" {
  description = "List of all actions that are to be authorized"
  type        = list(string)
  default     = []
}
