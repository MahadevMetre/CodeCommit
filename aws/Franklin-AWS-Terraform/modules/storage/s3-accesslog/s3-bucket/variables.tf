variable "s3_bucketName" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  default= ""
}

variable "environment" {
  default = ""
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


variable "aws_referer" {
	default = ""
}

variable "create_customer_communication_policy" {
  default = false
}

variable "allow_api_user_policy" {
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
  default = false
  type = bool
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

variable "alb_access_log_policy_generic" {
  default = false
  type = bool
}