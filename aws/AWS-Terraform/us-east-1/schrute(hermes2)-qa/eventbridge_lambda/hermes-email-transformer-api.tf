resource "aws_scheduler_schedule" "hms_email_transformer_schedule" {
	count = var.hermes_email_transformer_api_bool ? 1: 0
	name = var.schedule_name
	group_name = var.schedule_group_name
	description = "Scheduler to invoke Hermes Email Transformer Lambda"

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/1 * * * ? *)"
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