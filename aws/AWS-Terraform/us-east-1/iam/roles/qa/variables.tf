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