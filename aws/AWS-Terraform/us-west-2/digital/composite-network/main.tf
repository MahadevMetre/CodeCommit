module "composite_asg" {
  source = "../../../modules/composite_networks"

  #Ami Section
  ami_name               = var.ami_name
  source_instance_id = var.source_instance_id
  ami_tags = var.ami_tags

  //Launch Template Section
  template_name = var.template_name
  instance_type = var.instance_type
  key_name = var.key_name
  template_tags = var.template_tags
  associate_public_ip_address = var.associate_public_ip_address
  update_default_version = var.update_default_version
  #ebs_optimized = var.ebs_optimized
  #device_name = var.device_name
  #ebs_volume = var.ebs_volume
  #ebs_delete = var.ebs_delete
  #ebs_encrypted = var.ebs_encrypted
  #ebs_volume_type = var.ebs_volume_type
  launch_template_monitoring = var.launch_template_monitoring
  resource_type = var.resource_type
  resource_tags = var.resource_tags
  lt_security_groups = var.lt_security_groups

  // lb_listener section
	lbl_certificate_arn					= var.lbl_certificate_arn
	lbl_health_check_port				= var.lbl_health_check_port
	lbl_protocol						= var.lbl_protocol
	lbl_default_action_type				= var.lbl_default_action_type
    ssl_policy              = var.ssl_policy

  //ASG Schedule 
  start_stop_schedule = var.start_stop_schedule
  start_schedule_name  = var.start_schedule_name
  start_schedule_minsize               = var.start_schedule_minsize
  schedule_maxsize               = var.schedule_maxsize
  start_schedule_desired_capacity       = var.start_schedule_desired_capacity
  stop_schedule_start_time             = var.stop_schedule_start_time
  start_schedule_start_time         = var.start_schedule_start_time
  stop_schedule_name = var.stop_schedule_name
  stop_schedule_minsize               = var.stop_schedule_minsize
  stop_schedule_desired_capacity = var.stop_schedule_desired_capacity
  start_schedule_recurrence = var.start_schedule_recurrence
  stop_schedule_recurrence = var.stop_schedule_recurrence

  //ASG
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
  template_version = var.template_version
  autoscaling_tags = var.autoscaling_tags
  scaling_desired_capacity   = var.scaling_desired_capacity

  #notifications
  notifications = var.notifications
  topic_arn = var.topic_arn

  #loadbalancer
  lb_name							= var.lb_name
  lb_type				= var.lb_type
  lb_tags							= var.lb_tags
  lb_subnets							= var.lb_subnets
  lb_security_groups					= var.lb_security_groups
  lb_enable_deletion_protection		= var.lb_enable_deletion_protection
  lb_internal_bool					= var.lb_internal_bool
  lb_bucket_name						= var.lb_bucket_name
  lb_idle_timeout						= var.lb_idle_timeout

  #target Group
  tg_name				= var.tg_name
  tg_health_check_port				= var.tg_health_check_port
  tg_protocol						= var.tg_protocol
  tg_vpc_id							= var.tg_vpc_id
  tg_protocol_version				= var.tg_protocol_version
  tg_healthy_threshold				= var.tg_healthy_threshold
  tg_interval						= var.tg_interval
  tg_unhealthy_threshold				= var.tg_unhealthy_threshold
  tg_health_check_timeout			= var.tg_health_check_timeout
  tg_load_balancing_algorithm_type	= var.tg_load_balancing_algorithm_type

  #Route53
  create_route53_entry = var.create_route53_entry
  zone_id = var.zone_id
  route53_name = var.route53_name
  route53_type = var.route53_type
  ttl = var.ttl
}