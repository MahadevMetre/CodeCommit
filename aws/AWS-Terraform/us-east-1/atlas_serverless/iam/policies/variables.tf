variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_role_id" {
  type    = string
  default = ""
}

variable "atlas-serverless-parameter" {
  type = bool
  default =false
}

variable "ssm_parameter_arn" {
  type    = string
  default = ""
}

variable "digital-serverless-ses" {
  type = bool
  default =false
}