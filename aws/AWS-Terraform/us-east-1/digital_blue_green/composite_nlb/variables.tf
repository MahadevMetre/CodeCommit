variable "alb_sg_name" {}

variable "alb_sg_description" {}

variable "alb_sg_vpc_id" {}

variable "alb_sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map
}

variable "alb_sg_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "lb_name" {}

variable "lb_type" {}

variable "lb_tags" {
	type			=	map(string)
	default			=	{
							"terraform"	= "True"
						}
}

variable "lb_subnets" {
	type			=	list(string)
	default			=	[]
}

variable "lb_enable_deletion_protection" {
	default			=	true
}

variable "lb_internal_bool" {
	type			=	bool
	default			=	true
}

variable "lb_bucket_name" {}

variable "lb_idle_timeout" {}

variable "tg_name" {}

variable "tg_health_check_port" {}

variable "port" {}

variable "tg_protocol" {}

variable "tg_vpc_id" {}

variable "tg_deregistration_delay" {}

variable "tg_healthy_threshold" {}

variable "tg_interval" {}

variable "tg_unhealthy_threshold" {}

variable "tg_health_check_timeout" {}

variable "tg_health_check_protocol" {}

variable "tg_target_type" {}

variable "tg_health_check_path" {}

variable "tg_tags" {}

variable "lbl_certificate_arn" {
	default = ""
}

variable "lbl_health_check_port" {}

variable "lbl_protocol" {}

variable "lbl_default_action_type" {}

variable "lbl_ssl_policy" {
	default = ""
}