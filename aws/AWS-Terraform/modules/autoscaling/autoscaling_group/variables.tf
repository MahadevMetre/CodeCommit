variable "scaling_name" {}

variable "vpc_zone_identifier" {
  type = list(string)
  default = []
}

variable "max_size" {}

variable "min_size" {}

variable "health_check_type" {}

variable "launch_configuration" {
  default = ""
}

variable "termination_policies" {
  type = list(string)
  default = []
}

variable "enabled_metrics" {
  type = list(string)
  default = []
}

variable "health_check_grace_period" {}

variable "policy_name" {}

variable "template_name" {
  default = ""
}

variable "template_version" {
  default = ""
}

variable "target_value" {
  default = 70
}

variable "tags" {
  default = [
    {
      key                 = "terraform"
      value               = "true"
      propagate_at_launch = false
    }
  ]
}

variable "desired_capacity"{
  default = 0
}