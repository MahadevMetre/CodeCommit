resource "aws_autoscaling_schedule" "schedule" {
  scheduled_action_name  = var.schedule_name
  min_size               = var.schedule_minsize
  max_size               = var.schedule_maxsize
  desired_capacity       = var.schedule_desired_capacity
  start_time             = var.schedule_start_time
  autoscaling_group_name = var.autoscaling_group_name
  recurrence = var.asg_schedule_recurrence
  time_zone = var.asg_schedule_timezone
  lifecycle {
	ignore_changes = [start_time]
  }
}