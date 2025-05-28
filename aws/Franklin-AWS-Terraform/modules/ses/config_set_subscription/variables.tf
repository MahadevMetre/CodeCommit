variable "ses_destination_name" {}

variable "aws_ses_configuration_set_name" {}

variable "aws_sns_topic_arn" {}

variable "matching_types"{
  type = "list"
  default = []
}