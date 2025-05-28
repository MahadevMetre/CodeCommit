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


variable "baseline_over_rides_s3" {
  type    = bool
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

variable "parameter_arn" {
  description = "List of all ARNs that are to be authorized"
  type        = list(string)
  default     = []
}