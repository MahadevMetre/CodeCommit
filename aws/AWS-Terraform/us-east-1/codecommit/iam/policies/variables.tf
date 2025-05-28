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

variable "admins_policy" {
  type    = bool
  default = false
}


variable "automation_qa_lead_policy" {
  type    = bool
  default = false
}

variable "leads_policy" {
  type    = bool
  default = false
}

variable "rml_policy" {
  type    = bool
  default = false
}

variable "support_ui_dev_policy" {
  type    = bool
  default = false
}

variable "ui_dev_policy" {
  type    = bool
  default = false
}

variable "region" {
  type    = string
  default = ""
}

variable "account_id" {
  type    = string
  default = ""
}

variable "repository_name" {
  type    = string
  default = ""
}

