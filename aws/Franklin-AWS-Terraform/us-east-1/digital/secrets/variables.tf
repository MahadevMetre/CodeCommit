variable "secret_name" {
  type = string
}

variable "secret_description" {
  type = string
}

variable "secret_rc_window" {
  type = string
}

variable "secret_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "secret_values" {
  type = map
  default = {
    "key1" = "value1"
  }
}