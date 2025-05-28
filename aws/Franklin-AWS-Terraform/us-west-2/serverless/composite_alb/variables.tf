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

variable "tg_protocol" {}

variable "tg_vpc_id" {}

variable "tg_protocol_version" {}

variable "tg_deregistration_delay" {}

variable "tg_healthy_threshold" {}

variable "tg_interval" {}

variable "tg_unhealthy_threshold" {}

variable "tg_health_check_timeout" {}

variable "tg_load_balancing_algorithm_type" {}

variable "tg_health_check_protocol" {}

variable "tg_target_type" {}

variable "tg_health_check_path" {}

variable "tg_tags" {}

variable "tg2_name" {}

variable "tg2_health_check_port" {}

variable "tg2_protocol" {}

variable "tg2_vpc_id" {}

variable "tg2_protocol_version" {}

variable "tg2_deregistration_delay" {}

variable "tg2_healthy_threshold" {}

variable "tg2_interval" {}

variable "tg2_unhealthy_threshold" {}

variable "tg2_health_check_timeout" {}

variable "tg2_load_balancing_algorithm_type" {}

variable "tg2_health_check_protocol" {}

variable "tg2_target_type" {}

variable "tg2_health_check_path" {}

variable "tg2_success_codes" {}

variable "tg2_tags" {}

variable "tg3_name" {}

variable "tg3_health_check_port" {}

variable "tg3_protocol" {}

variable "tg3_vpc_id" {}

variable "tg3_protocol_version" {}

variable "tg3_deregistration_delay" {}

variable "tg3_healthy_threshold" {}

variable "tg3_interval" {}

variable "tg3_unhealthy_threshold" {}

variable "tg3_health_check_timeout" {}

variable "tg3_load_balancing_algorithm_type" {}

variable "tg3_health_check_protocol" {}

variable "tg3_target_type" {}

variable "tg3_health_check_path" {}

variable "tg3_success_codes" {}

variable "tg3_tags" {}

variable "lbr_priority" {}

variable "lbr_action_type" {}

variable "lbr_path_pattern" {}

variable "lbr_tags" {}

variable "lbr2_priority" {}

variable "lbr2_action_type" {}

variable "lbr2_path_pattern" {}

variable "lbr2_tags" {}

variable "lbl_certificate_arn" {
	default = ""
}

variable "lbl_health_check_port" {}

variable "lbl_protocol" {}

variable "lbl_default_action_type" {}

variable "lbl_ssl_policy" {
	default = ""
}

variable "route53_zone_id" {}

variable "route53_name" {}

variable "route53_type" {}