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

variable multi_region {
    type = bool
    default = false
}

variable iam_roles {
    type = list(string)
    default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable lasso-kms-policy {
    type = bool
    default = false
}