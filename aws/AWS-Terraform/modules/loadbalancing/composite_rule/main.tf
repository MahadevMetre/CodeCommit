/*
    To create the following resource
      Target group
        Health Check
        TG attachment
    rule

*/

#rule 
module "rule" {
    source = "../lb_rule"
    listener_arn        = var.listener_arn
    priority            = var.priority
    action_type         = var.action_type
    path_pattern        = var.path_pattern
    target_group_arn    = module.target_group.tgOut.arn
    tags                = var.rule_tag

}
    #target group
module "target_group" {
	source							= "../../autoscaling/listener/target_group/"
	target_group_name				= var.tg_name
	health_check_port				= var.tg_health_check_port
	protocol						= var.tg_protocol
	vpc_id							= var.tg_vpc_id
	protocol_version				= var.tg_protocol_version
	healthy_threshold				= var.tg_healthy_threshold
	interval						= var.tg_interval
	unhealthy_threshold				= var.tg_unhealthy_threshold
	health_check_timeout			= var.tg_health_check_timeout
	load_balancing_algorithm_type	= var.tg_load_balancing_algorithm_type
    health_check_protocol			= var.tg_protocol
	tg_tags							= var.tg_tags
}

#target attachment
module "target_attachment" {
    source           = "../target_attachment"
    target_group_arn = module.target_group.tgOut.arn
    target_id        = var.target_instance_id
    port             = var.tg_health_check_port
}