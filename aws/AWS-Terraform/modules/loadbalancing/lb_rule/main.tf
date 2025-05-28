resource "aws_lb_listener_rule" "lb_rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = var.action_type
    target_group_arn = var.target_group_arn
  }

  condition {
    path_pattern {
      values = var.path_pattern
    }
  }
  tags						=	var.tags
}