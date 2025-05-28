variable "s3_bucket_arn"{
  type = list(string)
  default = []
}

variable "iam_role_arn"{
  type = list(string)
  default = []
}


variable "s3_pub_iam_consumer" {
  default = false
}
variable "environment" {
  default = false
}

variable "standard_pub_iam_sub" {
  default = false
}

variable "delete_sqs_message" {
  default = false
}

variable "delete_sqs_msg_iam_arn_list" {
  default = []
}

variable "sqs_queue_name" {}

variable "consumer_list"{
  type = list(string)
  default = []
}

variable "publisher_list"{
  type = list(string)
  default = []
}


variable "sns_publisher_policy" {
  default = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "receive_message" {
  default = false
}

variable "dig_confirm_user_incoming" {
  default = false
}

variable "dig_confirm_user_error" {
  default = false
}

variable "root_arn" {
  type = string
  default = ""
}