###########################################################
#  Account Wide Variables
#
#  These values will be use throughout your account.

#### Environment

variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_short_name" {
default = ""
}

variable "logging_bucket_name" {
  default=""
}

variable "logging_bucket_base_prefix"{
  default = ""
}

variable "environment" {
  default = ""
}


############s3 variables ####

variable "create_ins_bucket_policy" {
  default     = false
}

variable "create_captiva_landing_zone_policy" {
  default     = false
}

variable "acl" {
  description = "The canned ACL to apply"
  default = "private"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default = {}
}


variable "logging" {
  default = [
    {
    target_bucket = ""
    target_prefix = ""
    }
  ]
  type = "list"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = false
}

variable "allowed_captiva_user_iam_arn_list"{
  type = "list"
  default = []
}

variable "allowed_ins_users_iam_arn_list"{
  type = "list"
  default = []
}

variable "s3_vpc_endpoint" {
  type = "list"
  default = []
}

variable "s3_authorized_ip_list"{
  type = "list"
  default = []
}

variable "sqs_event_notification_arn"{
  default = ""
}

variable "events" {
  type = "list"
  default = []
}

variable "filter_prefix" {
  default = ""
}

variable "filter_suffix" {
  default = ""
}


variable "lifecycle_tags" {
  description = "A map of tags to add to all resources"
  default = {}
}

variable "lifecycle_enabled_bool" {
  default = false
}

variable "lifecycle_transition_days" {
  default = ""
}

variable "lifecycle_storage_class" {
  default = ""
}

variable "versioning_enabled_bool" {
  default = false
}

variable "mfa_delete" {
  default = false
}

variable "lifecycle_id" {
  default = ""
}

variable "sns_event_notification_arn"{
  default = ""
}

variable "lifecycle_prefix"{
  default = ""
}

variable "aws_referer" {
	default = ""
}

variable "create_customer_communication_policy" {
  default = false
}

variable "bucket_arn" {
	default = ""
}