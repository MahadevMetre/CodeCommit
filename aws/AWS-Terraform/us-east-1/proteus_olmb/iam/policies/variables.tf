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

variable "proteus_s3_access_policy" {
  type = bool
  default = false
}

variable "bucket_env" {
  type = string
  default = ""
}

variable "proteus2_kms_policy" {
  type = bool
  default = false
}

variable "proteus2_acxiom_olmb_lambda_policy" {
  type = bool
  default = false
}

