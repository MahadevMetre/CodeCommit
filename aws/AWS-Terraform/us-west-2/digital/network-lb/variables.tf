// loadbalancer variables
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

variable "lb_security_groups" {
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

variable "health_check_protocol" {
    type = string
}

// lb_listener variables
variable "lbl_certificate_arn" {}

variable "lbl_health_check_port" {}

variable "lbl_protocol" {}

variable "lbl_default_action_type" {}

variable "ssl_policy" {}

#Route53
variable "zone_id" {}

variable "route53_name" {}

variable "route53_type" {}

variable "ttl" {}

# TG attachment
variable "scaling_name" {}