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

variable "ephemeral_storage_size" {
    type = number
    default = 512
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

variable "image_uri" {
    type = string
    default = ""
}

variable "layers" {
    type = list(string)
    default = []
}

variable "snap_start_apply_on" {
    type = string 
    default = "None"
}

variable "attach_apigw_permission" {
    type = bool
    default = false
}

variable "apigw_arn" {
  type = list(string)
    default = []
}

