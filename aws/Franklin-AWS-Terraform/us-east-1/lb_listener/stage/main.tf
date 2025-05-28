module "lb_listener" {
  source = "../../../modules/autoscaling/listener/lb_listener"
  load_balancer_arn = var.load_balancer_arn
  certificate_arn =var.certificate_arn
  health_check_port = var.health_check_port
  protocol = var.protocol
  default_action_type      = var.default_action_type
  target_group_arn = var.target_group_arn
}