variable "rule_set_name" {}

variable "rule_name" {}

variable "recipients"{
  type = list(string)
  default = []
}

variable "enabled_bool" {
  default = false
}

variable "scan_enabled_bool" {
  default = false
}

variable "tls_policy_bool" {
  default = false
}

variable "bucket_name" {}

variable "position" {}

variable "topic_arn" {}

variable "object_key_prefix" {}