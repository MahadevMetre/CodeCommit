variable "description" {
  type    = string
  default = ""
}

variable "key_usage" {
  type    = string
  default = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  type    = string
  default = "SYMMETRIC_DEFAULT"
}

variable "is_enabled" {
  type    = bool
  default = true
}

variable "enable_key_rotation" {
  type    = bool
  default = false
}

variable "alias_name" {
  type    = string
  default = ""
}

variable "repo-kms-policy" {
  type    = bool
  default = false
}

variable "multi_region" {
  type    = bool
  default = false
}

variable "parameter_policy" {
  type    = bool
  default = false
}

variable "iam_arn" {
  type    = list(string)
  default = []
}

variable "iam_roles" {
  type    = list(string)
  default = []
}

variable "storage_roles" {
  type    = list(string)
  default = []
}


variable "user_roles" {
  type    = list(string)
  default = []
}

variable "storage-encryption_policy" {
  type    = bool
  default = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "lasso-kms-policy" {
  type    = bool
  default = false
}

variable "fmg-serverless-efs-policy" {
  type    = bool
  default = false
}

variable "hermes-file-process-policy" {
  type    = bool
  default = false
}

# rds kms key
variable "fmg_rds_kms_policy" {
  description = "Boolean flag to determine whether to create the RDS KMS key policy."
  type        = bool
  default     = false
}

variable "marketing-kms-policy" {
  type    = bool
  default = false
}