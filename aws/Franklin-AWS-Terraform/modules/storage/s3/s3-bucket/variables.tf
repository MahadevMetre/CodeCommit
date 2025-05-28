variable "s3_bucketName" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  default= ""
}

variable "s3_logging_bucketName" {
  default=""
}

variable "logging_bucket_base_prefix"{
  default = ""
}

variable "environment" {
  default = ""
}

variable "logging"{
  default = []
  type = list
}


variable "acl" {
  description = "The canned ACL to apply"
  default = "private"
}


variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}


variable "allowed_captiva_user_iam_arn_list"{
  type = list(string)
  default = []
}

variable "allowed_ins_users_iam_arn_list"{
  type = list(string)
  default = []
}

variable "create_ins_bucket_policy" {
  default     = false
}

variable "create_captiva_landing_zone_policy" {
  default = false
}

variable "create_platformconfig_bucket_policy" {
  default = false
}
variable "s3_vpc_endpoint" {
  type = list(string)
  default = []
}

variable "s3_authorized_ip_list"{
  type = list(string)
  default = []
}

variable "sqs_event_notification_arn"{
  default = ""
}

variable "event_id" {
  default=""
}

variable "events" {
  type = list(string)
  default = []
}

variable "filter_prefix" {
  default = ""
}

variable "filter_suffix" {
  default = ""
}

variable "versioning_enabled_bool" {
  description = "A boolean that enables or disables bucket versioning"
  default     = false
}

variable "mfa_delete" {
  description = "A boolean that Enable MFA"
  default     = false
}

variable "lifecycle_enabled_bool" {
  description = "A boolean that enables lifecycle"
  default     = false
}

variable "lifecycle_tags" {
  description = "A map of tags to specify lifecycle parameters"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "lifecycle_transition_days" {
  default = 1
}

variable "lifecycle_storage_class" {
  default = "GLACIER"
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

variable "allow_api_user_policy" {
  type = bool
  default = false
}

variable "allow_api_user_policy_dr" {
  type = bool
  default = false
}

variable "replication_policy_dr" {
  type = bool
  default = false
}

variable "replication_policy_prodtodr" {
  type = bool
  default = false
}

variable "allowed_api_user_list" {
  type =  list
  default = []
}

variable "allowed_read_only_user_list" {
  type =  list
  default = []
}

variable "cloudfront_oai_policy" {
  type = bool
  default = false
}

variable "cloudfront_oai_arn" {
	default = ""
}

variable "insclaimsbockserver_policy" {
  type = bool
  default = false
}

variable "allow_ses_put_policy" {
  type = bool
  default = false
}

variable "insclaimsbockserver_policy_dr" {
  type = bool
  default = false
}

variable "bucket_notification_sqs_enabled" {
  type = bool
  default = false
}

variable "bucket_notification_sns_enabled" {
  type = bool
  default = false
}

variable "bucket_notification_lambda_enabled" {
  type = bool
  default = false
}

variable "lambda_event_triggers" {
  type = map
  default = {
	"test" = {
		lambda_notification_function_arn = "test"
		events = ["test"]
		filter_prefix = "test"
		filter_suffix = ".test"
		event_id = "test"
	}
  }
}

variable "lambda_notification_function_arn" {
  default=""
}

variable "fmservice_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "fmservice_vanity_biz_user_arn" {
	default = ""
}

variable "enforce_bucket_owner" {
  type = bool
  default = false
}

variable "replication" {
  type = bool
  default = false
}

variable "replication_id" {
  default = ""
}

variable "iam_role_replication_arn" {
	default = ""
}

variable "s3_destination_arn" {
	default = ""
}

variable "status" {
  default     = ""
}

variable "hermes_batch_processor_policy" {
  type = bool
  default = false
}

variable "pycharm_serverless_bucket_policy" {
  type = bool
  default = false
}

variable "marketing_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "marketing_vanity_allowed_users_list"{
  type =  list
  default = []
}