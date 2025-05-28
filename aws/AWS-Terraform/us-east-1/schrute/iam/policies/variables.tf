variable "create_iam_role" {
	type = bool
	default = true
}

variable "iam_role_name" {
  type = string
  default = ""
}

variable "iam_role_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_role_id" {
  type    = string
  default = ""
}

variable "athena-serverless-parameter" {
  type = bool
  default =false
}

variable "ssm_parameter_arn" {
  type    = string
  default = ""
}

variable "kms_key" {
  type    = string
  default = ""
}