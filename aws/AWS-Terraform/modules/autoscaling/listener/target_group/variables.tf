variable "target_group_name" {}

variable "health_check_port" {}

variable "port" {}

variable "protocol" {}

variable "vpc_id" {}

variable "protocol_version" {
    type = string
    default = "HTTP1"
}

variable "deregistration_delay" {
	default = "300"
}

variable "healthy_threshold" {}

variable "interval" {}

variable "unhealthy_threshold" {}

variable "health_check_timeout" {}

variable "success_codes" {
	default = "200"
}

variable "load_balancing_algorithm_type" {
    type = string 
    default = null
}

variable "health_check_protocol" {
    type = string
}

variable "tg_target_type" {
    type = string
    default = "instance"
}

variable "health_check_path" {
    type = string
	default = "/"
}

variable "tg_tags" {
  type = map
  default = {}
}