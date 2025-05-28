variable "lambda_function_name" {
    type = string
}

variable "role" {
    type = string
}

variable "description" {
    type = string
    default = ""
}

variable "env_variables" {
    type = map
    default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "memory_size" {
    type = number
    default = 128
}

variable "timeout" {
    type = number
    default = 3
}

variable "subnets" {
    type = list(string)
    default = []
}

variable "security_groups" {
    type = list(string)
    default = []
}

variable "reserved_concurrent_executions" {
    type = number 
    default = -1
}

variable "publish" {
    type = bool
    default = false
}

variable "runtime" {
    type = string
    default = ""
}

variable "handler" {
    type = string
    default = ""
}

variable "filename" {
    type = string
    default = "js/index.zip"
}

variable "package_type" {
    type = string 
    default = "Zip"
}

variable "source_code_hash" {}

variable "attach_sns_permission" {
    type = bool
    default = false
}