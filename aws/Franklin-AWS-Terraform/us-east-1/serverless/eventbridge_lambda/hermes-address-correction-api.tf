resource "aws_scheduler_schedule" "hms_address_correction_schedule" {
	count = var.hermes_address_correction_bool ? 1: 0
	name = var.schedule_name
	group_name = var.schedule_group_name
	description = "Scheduler to invoke Hermes Address Correction Lambda"

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(30 4 * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = module.lambda.lambda_out.arn
		role_arn = var.schedule_target_role_arn

		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
	// Ignore any changes made to the variable state
	lifecycle {
		ignore_changes = [state]
	}
}