variable description {
    type = string
    default = ""
}

variable key_usage {
    type = string
    default = "ENCRYPT_DECRYPT"
}

variable customer_master_key_spec {
    type = string
    default = "SYMMETRIC_DEFAULT"
}

variable is_enabled {
    type = bool
    default = true
}

variable enable_key_rotation {
    type = bool
    default = false
}

variable alias_name {
    type = string
    default = ""
}

variable parameter_policy {
    type = bool
    default = false
}

variable iam_arn {
    type = list(string)
    default = []
}

variable iam_roles {
    type = list(string)
    default = []
}

variable storage_roles {
    type = list(string)
    default = []
}

variable storage-encryption_policy {
    type = bool
    default = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable key_administrators {
    type = list(string)
    default = []
}

variable "marketing-kms-policy" {
  type    = bool
  default = false
}

