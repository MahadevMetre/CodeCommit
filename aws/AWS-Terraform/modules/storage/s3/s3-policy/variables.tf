variable "s3_bucketName" {
  type        = string
}


variable "create_ins_bucket_policy"{
  default = false
}

variable "create_captiva_landing_zone_policy" {
  default = false
}

variable "create_platformconfig_bucket_policy" {
  default = false
}

variable "allowed_captiva_user_iam_arn_list"{
  type =  list
  default = []
}

variable "allowed_ins_users_iam_arn_list"{
  type =  list
  default = []
}

variable "s3_vpc_endpoint" {
  type =  list
  default = []
}

variable "s3_authorized_ip_list"{
  type =  list
  default = []
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

variable "alb_access_log_policy" {
  type = bool
  default = false
}

variable "nginx_alb" {
  type = string
  default = null
}

variable "jboss_alb" {
  type = string
  default = null
}

variable "dig_jboss_alb" {
  type = string
  default = null
}

variable "dig_jboss_nlb" {
  type = string
  default = null
}

variable "dig_nginx_alb" {
  type = string
  default = null
}

variable "ecs_alb" {
  type = string
  default = null
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

variable "fmservice_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "fmservice_vanity_biz_user_arn" {
	default = ""
}

variable "hermes_batch_processor_policy" {
  type = bool
  default = false
}

variable "pycharm_serverless_bucket_policy" {
  type = bool
  default = false
}

variable "alb_access_log_policy_generic" {
  default = false
  type = bool
}

variable "marketing_vanity_bucket_policy" {
  type = bool
  default = false
}

variable "marketing_vanity_allowed_users_list"{
  type =  list
  default = []
}

variable "insurancenontermcabinet_policy" {
  type = bool
  default = false
}

variable "enable_ses_bucket_policy" {
  type        = bool
  default     = true
}
