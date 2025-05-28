variable "description" {
    type = string
    default = ""
}

variable "name" {
    type = string
}

variable "type" {
    type = string
    validation {
    condition     = contains(["String", "StringList", "SecureString"], var.type)
    error_message = "Valid values for var: type are String, StringList, SecureString."
  }
}

variable "value" {
    type = string
    sensitive = true
}

variable "key_id" {
    type = string
    default = ""
}

variable "tier" {
    type = string
    default = "Standard"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}