variable "role_tags" {
  description = "A map of tags to add to all resources"
  type = map
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
  description = "The Description of the role"
  type        = string
  default     = ""
}

variable "managed_policy_arns" {
  description = "List of all ARNs that are to be authorized"
  type        = list(string)
  default     = []
}

variable "principal_type" {
  description = "The nature of the Principal"
  type        = string
  default     = ""
}

variable "identifiers" {
  description = "List of all identifiers that are to be authorized"
  type        = list(string)
  default     = []
}

variable "user_defined_policy" {
  type = bool
  default = false
}

variable "baseline_over_rides_s3" {
  type = bool
  default =false
}

variable "statement_id" {
  description = "The statement ID of the policy"
  type        = string
  default     = ""
}

variable "policy_effects" {
  description = "List of all effects that are to be authorized"
  type        = string
  default     = "Deny"
}

variable "actions" {
  description = "List of all actions that are to be authorized"
  type        = list(string)
  default     = []
}

variable "policy_name" {
  description = "The name of the Policy"
  type        = string
  default     = ""
}

variable "parameter_arn" {
  description = "List of all actions that are to be authorized"
  type        = list(string)
  default     = []
}