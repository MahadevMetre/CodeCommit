variable "scaling_name" {}

variable "vpc_zone_identifier" {
  type = list(string)
  default = []
}

variable "max_size" {}

variable "min_size" {}

variable "health_check_type" {}

variable "launch_configuration" {}

variable "termination_policies" {
  type = list(string)
  default = []
}

variable "enabled_metrics" {
  type = list(string)
  default = []
}

variable "health_check_grace_period" {}

variable policy_name {}