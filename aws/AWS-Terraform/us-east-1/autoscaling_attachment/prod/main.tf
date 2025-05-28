module "asg_attachment" {
  source = "../../../modules/autoscaling/listener"
  autoscaling_group_name = var.autoscaling_group_name
  alb_target_group_arn = var.alb_target_group_arn
}