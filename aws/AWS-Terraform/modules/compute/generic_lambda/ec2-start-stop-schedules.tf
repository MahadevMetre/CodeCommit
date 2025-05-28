resource "aws_scheduler_schedule_group" "ec2_instance_management" {
	count	= var.ec2_start_stop_schedules ? 1 : 0
	name	= "ec2_instance_management"
	tags	= var.schedule_group_tags
}

resource "aws_scheduler_schedule" "start_jboss_instances" {
	count					= var.ec2_start_stop_schedules ? 1 : 0
	name					= "start_jboss_instances_on_monday"
	group_name				= aws_scheduler_schedule_group.ec2_instance_management[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(50 2 ? * 2 *)"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
		"tagValue": "jboss-admin-adhoc"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}

resource "aws_scheduler_schedule" "start_ec2_instances" {
	count					= var.ec2_start_stop_schedules ? 1 : 0
	name					= "start_ec2_instances_on_monday"
	group_name				= aws_scheduler_schedule_group.ec2_instance_management[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(0 3 ? * 2 *)"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
		"tagValue": "*adhoc*"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}

resource "aws_scheduler_schedule" "stop_ec2_instances" {
	count					= var.ec2_start_stop_schedules ? 1 : 0
	name					= "stop_ec2_instances_on_saturday"
	group_name				= aws_scheduler_schedule_group.ec2_instance_management[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(0 0 ? * 7 *)"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
		"tagValue": "*adhoc*"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}