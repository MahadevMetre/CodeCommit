variable "sns_arn_val" {}

variable "s3_bucket_arn_list"{
  type = list(string)
  default = []
}

variable "standard_s3_pub_access_policy" {}

variable "standard_pub_access_policy_bool" {}

variable "ses_access_policy" {}

variable "source_owner" {}

variable "publisher" {
  type = list(string)
  default = []
}

variable "autoscaling_policy" {}