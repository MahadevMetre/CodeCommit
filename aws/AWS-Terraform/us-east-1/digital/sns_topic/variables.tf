variable "s3_bucket_arn_list"{
    type = list(string)
    default = []
}

variable "s3_pub_access_policy_bool" {
    default = false
}
variable "create_subscriptions_bool"{
  default = false
}
variable "standard_pub_access_policy_bool" {
  default = false
}

variable "sns_topic_name" {}
variable "publisher" {
  type = list(string)
  default = []
}
variable "subscriptions" {
  description = "Map of subscriptions"
  type        = map
  default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "ses_access_policy" {
	default = false
}

variable "source_owner" {
	default = ""
}

variable "autoscaling_policy" {
	default = false
}