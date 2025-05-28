module "ami" {
    source = "../ami_from_instance"
    name               = var.ami_name
    source_instance_id = var.source_instance_id
    tags = var.ami_tags
}

module "launch_template" {
  source = "../launch_template"
  template_name = var.template_name
  image_id = module.ami.get_ami
  instance_type = var.instance_type
  key_name = var.key_name
  template_tags = var.template_tags
  associate_public_ip_address = var.associate_public_ip_address
  update_default_version = var.update_default_version
  ebs_optimized = var.ebs_optimized
  device_name = var.device_name
  ebs_volume = var.ebs_volume
  ebs_delete = var.ebs_delete
  ebs_encrypted = var.ebs_encrypted
  ebs_volume_type = var.ebs_volume_type
  launch_template_monitoring = var.launch_template_monitoring
  resource_type = var.resource_type
  resource_tags = var.resource_tags
}

module "asg" {
    source = "../autoscaling_group"
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
  source                 = "../autoscaling-schedule"
  count = var.start_stop_schedule ? 1: 0
  schedule_name  = var.stop_schedule_name
  schedule_minsize               = var.stop_schedule_minsize
  schedule_maxsize               = var.schedule_maxsize
  schedule_desired_capacity       = var.stop_schedule_desired_capacity
  schedule_start_time             = var.stop_schedule_start_time
  autoscaling_group_name = var.scaling_name
}

module "start_asg_schedule" {
  source                 = "../autoscaling-schedule"
  count = var.start_stop_schedule ? 1: 0
  schedule_name  = var.start_schedule_name
  schedule_minsize               = var.start_schedule_minsize
  schedule_maxsize               = var.schedule_maxsize
  schedule_desired_capacity       = var.start_schedule_desired_capacity
  schedule_start_time             = var.start_schedule_start_time
  autoscaling_group_name = var.scaling_name
}

module "lb_listener" {
	source							= "../listener/lb_listener/"
	load_balancer_arn				= var.lbl_loadbalancer_arn
	certificate_arn					= var.lbl_certificate_arn
	health_check_port				= var.lbl_health_check_port
	protocol						= var.lbl_protocol
	target_group_arn				= var.lbl_target_group_arn
	default_action_type				= var.lbl_default_action_type
  ssl_policy              = var.ssl_policy
}

module "autoscaling_notification" {
    source = "../autoscaling_notification"
    group_names = [var.scaling_name]
    notifications = var.notifications
    topic_arn = var.topic_arn
}

module "asg_attachment" {
  source = "../listener"
  autoscaling_group_name = var.scaling_name
  alb_target_group_arn = var.lbl_target_group_arn
}