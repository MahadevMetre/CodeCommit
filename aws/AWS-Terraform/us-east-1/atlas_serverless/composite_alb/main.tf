module "alb_security_group" {
	source				= "../../../modules/networking/securitygroups"
	name				= var.alb_sg_name
	description			= var.alb_sg_description
	vpc_id				= var.alb_sg_vpc_id
	sg_ingress_rules	= var.alb_sg_ingress_rules
	tags				= var.alb_sg_tags
}

module "loadbalancer" {
	source							= "../../../modules/loadbalancing/loadbalancer/"
	name							= var.lb_name
	load_balancer_type				= var.lb_type
	tags							= var.lb_tags
	subnets							= var.lb_subnets
	security_groups					= [module.alb_security_group.sg_out]
	enable_deletion_protection		= var.lb_enable_deletion_protection
	internal_bool					= var.lb_internal_bool
	bucket_name						= var.lb_bucket_name
	idle_timeout					= var.lb_idle_timeout
}

module "target_group" {
	source							= "../../../modules/autoscaling/listener/target_group/"
	target_group_name				= var.tg_name
	health_check_port				= var.tg_health_check_port
	protocol						= var.tg_protocol
	vpc_id							= var.tg_vpc_id
	protocol_version				= var.tg_protocol_version
	deregistration_delay			= var.tg_deregistration_delay
	healthy_threshold				= var.tg_healthy_threshold
	interval						= var.tg_interval
	unhealthy_threshold				= var.tg_unhealthy_threshold
	health_check_timeout			= var.tg_health_check_timeout
	load_balancing_algorithm_type	= var.tg_load_balancing_algorithm_type
	health_check_protocol 			= var.tg_health_check_protocol
	tg_target_type					= var.tg_target_type
	health_check_path				= var.tg_health_check_path
	tg_tags							= var.tg_tags
	port 							= var.port
}

module "lb_listener" {
	source					= "../../../modules/autoscaling/listener/lb_listener/"
	load_balancer_arn		= module.loadbalancer.alb.arn
	certificate_arn			= var.lbl_certificate_arn
	health_check_port		= var.lbl_health_check_port
	protocol				= var.lbl_protocol
	target_group_arn		= module.target_group.tgOut.arn
	default_action_type		= var.lbl_default_action_type
	ssl_policy				= var.lbl_ssl_policy
}

module "route53_entry" {
	source				= "../../../modules/route53"
	zone_id				= var.route53_zone_id
	name				= var.route53_name
	type				= var.route53_type
	records				= [module.loadbalancer.alb.dns_name]
}