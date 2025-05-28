#lb rule
variable "listener_arn" {
    type = string
}

variable "priority" {
    type = number
    default = 1
}

variable "action_type" {
    type = string
    default = "forward"
}

variable "path_pattern" {
    type = list(string)
    default = ["/*"]
}

variable "rule_tag" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

// target_group variables
variable "tg_name" {}

variable "tg_health_check_port" {}

variable "tg_protocol" {}

variable "tg_vpc_id" {}

variable "tg_protocol_version" {}

variable "tg_healthy_threshold" {}

variable "tg_interval" {}

variable "tg_unhealthy_threshold" {}

variable "tg_health_check_timeout" {}

variable "tg_load_balancing_algorithm_type" {}

#target attachment 
variable "target_instance_id" {
    type = string
}