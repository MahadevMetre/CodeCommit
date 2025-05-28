resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.load_balancer_arn
  certificate_arn =var.certificate_arn
  port = var.health_check_port
  protocol = var.protocol
  ssl_policy = var.ssl_policy

  default_action {
    target_group_arn = var.target_group_arn
    type             = var.default_action_type
  }
}