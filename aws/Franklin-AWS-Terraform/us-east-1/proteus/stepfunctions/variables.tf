variable "create_log_group_bool" {
  type = bool
  default = false
}

variable "cloudwatch_log_group_name" {}

variable "cloudwatch_log_group_retention" {}

variable "cloudwatch_log_group_tags" {}

variable "sfn_name" {
  type = string
}

variable "sfn_iam_role_arn" {
  type = string
}

variable "sfn_definition_json" {
  default = ""
}

variable "sfn_log_destination" {
  default = ""
}

variable "sfn_tags" {
  default = ""
}

variable "create_batch_lambda_arn" {
  default = ""
}

variable "update_batch_lambda_arn" {
  default = ""
}

variable "dynamodb_table_name" {
  default = ""
}

variable "gluejob_name" {
  default = ""
}