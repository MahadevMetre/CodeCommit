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

#Policy
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

variable "aws_referer" {
	default = ""
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

variable "ecs_alb" {
  type = string
  default = null
}
