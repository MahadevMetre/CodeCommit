resource "aws_autoscaling_group" "autoscaling" {
  name = var.scaling_name
  vpc_zone_identifier        = var.vpc_zone_identifier  
  max_size = var.max_size
  min_size = var.min_size
  health_check_type = var.health_check_type
  launch_configuration = var.launch_configuration
  termination_policies = var.termination_policies
  enabled_metrics = var.enabled_metrics
  
  instance_refresh {
    strategy = "Rolling"
    triggers = ["launch_template"]
  }

  launch_template {
    name      = var.template_name
    version = var.template_version
  }
  
  health_check_grace_period = var.health_check_grace_period
  wait_for_capacity_timeout = 0 ##Skips waiting for capacity and proceeds to create a scaling group
  tags = var.tags
  desired_capacity = var.desired_capacity
  lifecycle {
	ignore_changes = [min_size, desired_capacity, target_group_arns]
  }
}

resource "aws_autoscaling_policy" "dynamic_scaling" {
  name                   = var.policy_name
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.autoscaling.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.target_value
  }
  lifecycle {
	ignore_changes = [adjustment_type]
  }
}