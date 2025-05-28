variable "repository_name" {
  type        = string
}

variable "description" {
  type        = string
  default     = ""
}

# variable "customer_managed_key_arn" {
#   type        = string
# }

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "kms_key_id" {}
