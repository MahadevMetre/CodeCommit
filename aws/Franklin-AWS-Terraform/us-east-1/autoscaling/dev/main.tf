module "autoscaling" {
  source = "../../../modules/autoscaling/autoscaling_group"
  scaling_name = var.scaling_name
  vpc_zone_identifier         = var.vpc_zone_identifier  
  max_size = var.max_size
  min_size = var.min_size
  health_check_type = var.health_check_type
  launch_configuration = var.launch_configuration
  termination_policies = var.termination_policies
  enabled_metrics = var.enabled_metrics
  health_check_grace_period = var.health_check_grace_period
  policy_name = var.policy_name
}