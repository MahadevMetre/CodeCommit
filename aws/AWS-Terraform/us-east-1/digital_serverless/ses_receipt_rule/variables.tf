variable "rule_name" {
  type        = string
}

variable "rule_set_name" {
  type        = string
}

variable "recipient" {
  type        = string
}

variable "s3_bucket_name" {
  type        = string
}

variable "s3_object_key_prefix" {
  type        = string
}

variable "sns_topic_arn" {
  type        = string
}
