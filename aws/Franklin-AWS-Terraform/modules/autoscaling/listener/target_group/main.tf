resource "aws_lb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.health_check_port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  protocol_version = var.protocol_version
  deregistration_delay = var.deregistration_delay

  health_check {
    port     = var.health_check_port
    protocol = var.health_check_protocol
    healthy_threshold = var.healthy_threshold
    interval = var.interval
    path = var.health_check_path
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.health_check_timeout
	matcher = var.success_codes
  }
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  target_type = var.tg_target_type
  tags = var.tg_tags
}