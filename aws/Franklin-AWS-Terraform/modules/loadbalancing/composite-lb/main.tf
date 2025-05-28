/*
	Use this for Network lb or scenario in which health check protocol is different from lb protocol

	To create the following resource
      Target group
        Health Check
        TG attachment
      lb listener
      Load balancer
      Route 53 for the lb  - A type record 
*/
module "loadbalancer" {
	source							= "../loadbalancer/"
	name							= var.lb_name
	load_balancer_type				= var.lb_type
	tags							= var.lb_tags
	subnets							= var.lb_subnets
	security_groups					= var.lb_security_groups
	enable_deletion_protection		= var.lb_enable_deletion_protection
	internal_bool					= var.lb_internal_bool
	bucket_name						= var.lb_bucket_name
}

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
	#load_balancing_algorithm_type	= var.tg_load_balancing_algorithm_type
	health_check_protocol 			= var.health_check_protocol
}

module "lb_listener" {
	source							= "../../autoscaling/listener/lb_listener/"
	load_balancer_arn				= module.loadbalancer.alb.arn
	certificate_arn					= var.lbl_certificate_arn
	health_check_port				= var.lbl_health_check_port
	protocol						= var.lbl_protocol
	target_group_arn				= module.target_group.tgOut.arn
	default_action_type				= var.lbl_default_action_type
    ssl_policy              = var.ssl_policy
}

module "asg_attachment" {
  source = "../../autoscaling/listener"
  autoscaling_group_name = var.scaling_name
  alb_target_group_arn = module.target_group.tgOut.arn
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = var.route53_name
  type    = var.route53_type

  alias {
    name                   = module.loadbalancer.alb.dns_name
    zone_id                = module.loadbalancer.alb.zone_id
    evaluate_target_health = true
  }
}