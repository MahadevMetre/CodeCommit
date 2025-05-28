resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.autoscaling_group_name
  alb_target_group_arn   = var.alb_target_group_arn
}