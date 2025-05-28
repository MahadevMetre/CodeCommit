variable "job_name" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "cmd_name" {
  type = string
}

variable "cmd_python_version" {
  type = string
}

variable "cmd_script_location" {
  type = string
}

variable "max_concurrent_runs" {
  type = string
}

variable "execution_class" {
  type = string
}

variable "max_capacity" {
  type = string
}

variable "connections" {
  type = list
}

variable "default_arguments" {}