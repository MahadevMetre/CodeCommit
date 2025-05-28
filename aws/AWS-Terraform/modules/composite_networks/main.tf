/*

    Don't use this module for creation of Network load balancer as we are hard coding TG health check protocol

    To create the following resource
      AMI
      Launch template
      ASG
        ASG Schedules
        ASG notifications
        ASG Policy
      Target group
        Health Check
        TG attachment
      lb listener
      Load balancer
      Route 53 for the lb  - A type record 
*/
module "ami" {
    source = "../autoscaling/ami_from_instance"
    name               = var.ami_name
    source_instance_id = var.source_instance_id
    tags = var.ami_tags
}

module "launch_template" {
  source = "../autoscaling/launch_template"
  template_name = var.template_name
  image_id = module.ami.get_ami
  instance_type = var.instance_type
  key_name = var.key_name
  template_tags = var.template_tags
  associate_public_ip_address = var.associate_public_ip_address
  update_default_version = var.update_default_version
  /*ebs_optimized = var.ebs_optimized
  device_name = var.device_name
  ebs_volume = var.ebs_volume
  ebs_delete = var.ebs_delete
  ebs_encrypted = var.ebs_encrypted
  ebs_volume_type = var.ebs_volume_type*/
  launch_template_monitoring = var.launch_template_monitoring
  resource_type = var.resource_type
  resource_tags = var.resource_tags
  lt_security_groups = var.lt_security_groups
}

module "asg" {
    source = "../autoscaling/autoscaling_group"
    scaling_name = var.scaling_name
    vpc_zone_identifier   = var.vpc_zone_identifier  
    max_size = var.max_size
    min_size = var.min_size
    health_check_type = var.health_check_type
    launch_configuration = var.launch_configuration
    termination_policies = var.termination_policies
    enabled_metrics = var.enabled_metrics  
    health_check_grace_period = var.health_check_grace_period
    policy_name                   = var.policy_name
    target_value = var.target_value
    template_name = var.template_name
    template_version = var.template_version
    tags = var.autoscaling_tags
    desired_capacity   = var.scaling_desired_capacity
}

module "stop_asg_schedule" {
  source                 = "../autoscaling/autoscaling-schedule"
  count = var.start_stop_schedule ? 1: 0
  schedule_name  = var.stop_schedule_name
  schedule_minsize               = var.stop_schedule_minsize
  schedule_maxsize               = var.schedule_maxsize
  schedule_desired_capacity       = var.stop_schedule_desired_capacity
  schedule_start_time             = var.stop_schedule_start_time
  autoscaling_group_name = var.scaling_name
  asg_schedule_recurrence = var.stop_schedule_recurrence
}

module "start_asg_schedule" {
  source                 = "../autoscaling/autoscaling-schedule"
  count = var.start_stop_schedule ? 1: 0
  schedule_name  = var.start_schedule_name
  schedule_minsize               = var.start_schedule_minsize
  schedule_maxsize               = var.schedule_maxsize
  schedule_desired_capacity       = var.start_schedule_desired_capacity
  schedule_start_time             = var.start_schedule_start_time
  autoscaling_group_name = var.scaling_name
  asg_schedule_recurrence = var.start_schedule_recurrence
}

module "lb_listener" {
	source							= "../autoscaling/listener/lb_listener/"
	load_balancer_arn				= module.loadbalancer.alb.arn
	certificate_arn					= var.lbl_certificate_arn
	health_check_port				= var.lbl_health_check_port
	protocol						= var.lbl_protocol
	target_group_arn				= module.target_group.tgOut.arn
	default_action_type				= var.lbl_default_action_type
    ssl_policy              = var.ssl_policy
}

module "autoscaling_notification" {
    source = "../autoscaling/autoscaling_notification"
    group_names = [var.scaling_name]
    notifications = var.notifications
    topic_arn = var.topic_arn
}

module "asg_attachment" {
  source = "../autoscaling/listener"
  autoscaling_group_name = var.scaling_name
  alb_target_group_arn = module.target_group.tgOut.arn
}

module "loadbalancer" {
	source							= "../loadbalancing/loadbalancer/"
	name							= var.lb_name
	load_balancer_type				= var.lb_type
	tags							= var.lb_tags
	subnets							= var.lb_subnets
	security_groups					= var.lb_security_groups
	enable_deletion_protection		= var.lb_enable_deletion_protection
	internal_bool					= var.lb_internal_bool
	bucket_name						= var.lb_bucket_name
	idle_timeout					= var.lb_idle_timeout
}

module "target_group" {
	source							= "../autoscaling/listener/target_group/"
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
  port 							  = var.port
}

/*
module "route53" {
  source = "../route53"
  zone_id = var.zone_id
  name = var.route53_name
  type = var.route53_type
  ttl = var.ttl
  records = [module.loadbalancer.alb.dns_name]
}*/

resource "aws_route53_record" "www" {
  count		= var.create_route53_entry ? 1: 0
  zone_id	= var.zone_id
  name		= var.route53_name
  type		= var.route53_type

  alias {
    name                   = module.loadbalancer.alb.dns_name
    zone_id                = module.loadbalancer.alb.zone_id
    evaluate_target_health = true
  }
}