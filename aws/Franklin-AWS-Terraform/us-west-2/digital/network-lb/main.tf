module "composite-lb" {
	source								= "../../../modules/loadbalancing/composite-lb/"

	// loadbalancer variables
	lb_name								= var.lb_name
	lb_type								= var.lb_type
	lb_tags								= var.lb_tags
	lb_subnets							= var.lb_subnets
	lb_security_groups					= var.lb_security_groups
	lb_enable_deletion_protection		= var.lb_enable_deletion_protection
	lb_internal_bool					= var.lb_internal_bool
	lb_bucket_name						= var.lb_bucket_name

	// target_group variables
	tg_name								= var.tg_name
	tg_health_check_port				= var.tg_health_check_port
	tg_protocol							= var.tg_protocol
	tg_vpc_id							= var.tg_vpc_id
	tg_protocol_version					= var.tg_protocol_version
	tg_healthy_threshold				= var.tg_healthy_threshold
	tg_interval							= var.tg_interval
	tg_unhealthy_threshold				= var.tg_unhealthy_threshold
	tg_health_check_timeout				= var.tg_health_check_timeout
	health_check_protocol				= var.health_check_protocol

	// lb_listener section
	lbl_certificate_arn					= var.lbl_certificate_arn
	lbl_health_check_port				= var.lbl_health_check_port
	lbl_protocol						= var.lbl_protocol
	lbl_default_action_type				= var.lbl_default_action_type
    ssl_policy              			= var.ssl_policy

	#Route53
	zone_id = var.zone_id
	route53_name = var.route53_name
	route53_type = var.route53_type
	ttl = var.ttl

	# TG attachment
	scaling_name 						= var.scaling_name
}