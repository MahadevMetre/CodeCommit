module "target_group" {
  source = "../../../modules/autoscaling/listener/target_group"
  health_check_port = var.health_check_port
  protocol = var.protocol
  target_group_name = var.target_group_name
  vpc_id   = var.vpc_id
  protocol_version = var.protocol_version
  healthy_threshold = var.healthy_threshold
  interval = var.interval
  unhealthy_threshold = var.unhealthy_threshold
  health_check_timeout = var.health_check_timeout
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
}