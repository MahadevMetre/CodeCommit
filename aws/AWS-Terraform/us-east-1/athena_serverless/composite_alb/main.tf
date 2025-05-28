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

module "target_group2" {
	source							= "../../../modules/autoscaling/listener/target_group/"
	target_group_name				= var.tg2_name
	health_check_port				= var.tg2_health_check_port
	protocol						= var.tg2_protocol
	vpc_id							= var.tg2_vpc_id
	protocol_version				= var.tg2_protocol_version
	deregistration_delay			= var.tg2_deregistration_delay
	healthy_threshold				= var.tg2_healthy_threshold
	interval						= var.tg2_interval
	unhealthy_threshold				= var.tg2_unhealthy_threshold
	health_check_timeout			= var.tg2_health_check_timeout
	load_balancing_algorithm_type	= var.tg2_load_balancing_algorithm_type
	health_check_protocol 			= var.tg2_health_check_protocol
	tg_target_type					= var.tg2_target_type
	health_check_path				= var.tg2_health_check_path
	tg_tags							= var.tg2_tags
	port 							= var.port2
}

module "target_group3" {
	source							= "../../../modules/autoscaling/listener/target_group/"
	target_group_name				= var.tg3_name
	health_check_port				= var.tg3_health_check_port
	protocol						= var.tg3_protocol
	vpc_id							= var.tg3_vpc_id
	protocol_version				= var.tg3_protocol_version
	deregistration_delay			= var.tg3_deregistration_delay
	healthy_threshold				= var.tg3_healthy_threshold
	interval						= var.tg3_interval
	unhealthy_threshold				= var.tg3_unhealthy_threshold
	health_check_timeout			= var.tg3_health_check_timeout
	load_balancing_algorithm_type	= var.tg3_load_balancing_algorithm_type
	health_check_protocol 			= var.tg3_health_check_protocol
	tg_target_type					= var.tg3_target_type
	health_check_path				= var.tg3_health_check_path
	tg_tags							= var.tg3_tags
	port 							= var.port3
}

module "target_group4" {
	source							= "../../../modules/autoscaling/listener/target_group/"
	target_group_name				= var.tg4_name
	health_check_port				= var.tg4_health_check_port
	protocol						= var.tg4_protocol
	vpc_id							= var.tg4_vpc_id
	protocol_version				= var.tg4_protocol_version
	deregistration_delay			= var.tg4_deregistration_delay
	healthy_threshold				= var.tg4_healthy_threshold
	interval						= var.tg4_interval
	unhealthy_threshold				= var.tg4_unhealthy_threshold
	health_check_timeout			= var.tg4_health_check_timeout
	load_balancing_algorithm_type	= var.tg4_load_balancing_algorithm_type
	health_check_protocol 			= var.tg4_health_check_protocol
	tg_target_type					= var.tg4_target_type
	health_check_path				= var.tg4_health_check_path
	tg_tags							= var.tg4_tags
	port 							= var.port4
}

module "target_group5" {
	source							= "../../../modules/autoscaling/listener/target_group/"
	target_group_name				= var.tg5_name
	health_check_port				= var.tg5_health_check_port
	protocol						= var.tg5_protocol
	vpc_id							= var.tg5_vpc_id
	protocol_version				= var.tg5_protocol_version
	deregistration_delay			= var.tg5_deregistration_delay
	healthy_threshold				= var.tg5_healthy_threshold
	interval						= var.tg5_interval
	unhealthy_threshold				= var.tg5_unhealthy_threshold
	health_check_timeout			= var.tg5_health_check_timeout
	load_balancing_algorithm_type	= var.tg5_load_balancing_algorithm_type
	health_check_protocol 			= var.tg5_health_check_protocol
	tg_target_type					= var.tg5_target_type
	health_check_path				= var.tg5_health_check_path
	tg_tags							= var.tg5_tags
	port 							= var.port5
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

module "lb_rule1" {
	source					= "../../../modules/loadbalancing/lb_rule/"
	listener_arn			= module.lb_listener.lblOut.arn
	priority				= var.lbr1_priority
	action_type				= var.lbr1_action_type
	target_group_arn		= module.target_group.tgOut.arn
	path_pattern			= var.lbr1_path_pattern
	tags					= var.lbr1_tags
}

module "lb_rule2" {
	source					= "../../../modules/loadbalancing/lb_rule/"
	listener_arn			= module.lb_listener.lblOut.arn
	priority				= var.lbr2_priority
	action_type				= var.lbr2_action_type
	target_group_arn		= module.target_group2.tgOut.arn
	path_pattern			= var.lbr2_path_pattern
	tags					= var.lbr2_tags
}

module "lb_rule3" {
	source					= "../../../modules/loadbalancing/lb_rule/"
	listener_arn			= module.lb_listener.lblOut.arn
	priority				= var.lbr3_priority
	action_type				= var.lbr3_action_type
	target_group_arn		= module.target_group3.tgOut.arn
	path_pattern			= var.lbr3_path_pattern
	tags					= var.lbr3_tags
}

module "lb_rule4" {
	source					= "../../../modules/loadbalancing/lb_rule/"
	listener_arn			= module.lb_listener.lblOut.arn
	priority				= var.lbr4_priority
	action_type				= var.lbr4_action_type
	target_group_arn		= module.target_group4.tgOut.arn
	path_pattern			= var.lbr4_path_pattern
	tags					= var.lbr4_tags
}

module "lb_rule5" {
	source					= "../../../modules/loadbalancing/lb_rule/"
	listener_arn			= module.lb_listener.lblOut.arn
	priority				= var.lbr5_priority
	action_type				= var.lbr5_action_type
	target_group_arn		= module.target_group5.tgOut.arn
	path_pattern			= var.lbr5_path_pattern
	tags					= var.lbr5_tags
}

module "route53_entry" {
	source				= "../../../modules/route53"
	zone_id				= var.route53_zone_id
	name				= var.route53_name
	type				= var.route53_type
	records				= [module.loadbalancer.alb.dns_name]
}