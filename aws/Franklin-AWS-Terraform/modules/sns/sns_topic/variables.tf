variable "sns_topic_name" {}

variable "s3_pub_access_policy_bool" {}
variable "standard_pub_access_policy_bool" {}
variable "create_subscriptions_bool" {}
variable "autoscaling_policy" {}

variable "s3_bucket_arn_list" {
    type = list(string)
    default = []
}

variable "subscriptions" {
  description = "Map of subscriptions (subscription = ['protocol', 'endpoint'])"
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

variable "publisher" {
  type = list(string)
  default = []
}

variable "ses_access_policy" {}

variable "source_owner" {}