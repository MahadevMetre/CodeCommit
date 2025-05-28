variable "iam_policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "iam_policy_desc" {
  type = string
  default = ""
}

variable "iam_policy_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "hermes_archival_process_policy" {
  type = bool
  default = false
}

variable "hermes_file_process_policy" {
  type = bool
  default = false
}

variable "hermes_file_integration_policy" {
  type = bool
  default = false
}

variable "hermes_secrets_mgr_policy" {
  type = bool
  default = false
}

variable "hermes_s3_access_policy" {
  type = bool
  default = false
}

variable "pycharm_aws_user_policy" {
  type = bool
  default = false
}

variable hermes-ses-access-policy {
  type  = bool
  default = false
}

variable iam_role_id {
  type = string
  default = ""
}

variable "parameter_arn" {
  description = "List of all ARNs that are to be authorized"
  type        = list(string)
  default     = []
}