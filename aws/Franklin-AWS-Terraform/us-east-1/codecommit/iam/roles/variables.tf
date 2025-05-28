variable "role_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default = {
    "terraform" = "True"
  }
}

variable "role_name" {
  description = "The name of the role"
  type        = string
  default     = ""
}

variable "iam_role_desc" {
  type    = string
  default = ""
}

variable "admins_policy" {
  type    = bool
  default = false
}

variable "admins_policy_arn" {
  type    = string
  default = ""
}

variable "automation_qa_lead_policy" {
  type    = bool
  default = false
}

variable "automation_qa_lead_policy_arn" {
  type    = string
  default = ""
}

variable "leads_policy" {
  type    = bool
  default = false
}

variable "leads_policy_arn" {
  type    = string
  default = ""
}

variable "rml_policy" {
  type    = bool
  default = false
}

variable "rml_policy_arn" {
  type    = string
  default = ""
}

variable "support_ui_dev_policy" {
  type    = bool
  default = false
}

variable "support_ui_dev_policy_arn" {
  type    = string
  default = ""
}

variable "ui_dev_policy" {
  type    = bool
  default = false
}

variable "ui_dev_policy_arn" {
  type    = string
  default = ""
}