module "composite_rule" {
    source              = "../../../modules/loadbalancing/composite_rule"

#rule
    listener_arn        = var.listener_arn
    priority            = var.priority
    action_type         = var.action_type
    path_pattern        = var.path_pattern
    rule_tag            = var.rule_tag

#target group
	tg_name								= var.tg_name
	tg_health_check_port				= var.tg_health_check_port
	tg_protocol							= var.tg_protocol
	tg_vpc_id							= var.tg_vpc_id
	tg_protocol_version					= var.tg_protocol_version
	tg_healthy_threshold				= var.tg_healthy_threshold
	tg_interval							= var.tg_interval
	tg_unhealthy_threshold				= var.tg_unhealthy_threshold
	tg_health_check_timeout				= var.tg_health_check_timeout
	tg_load_balancing_algorithm_type	= var.tg_load_balancing_algorithm_type
	tg_tags								= var.tg_tags

#target attachment
    target_instance_id        = var.target_instance_id
}