resource "aws_scheduler_schedule" "hms_cuscomm_upload_schedule" {
	count = var.hermes_email_archival_cuscommupload_api_bool ? 1: 0
	name = var.schedule_name
	group_name = var.schedule_group_name
	description = "Scheduler to invoke Email Archival & Customer Communication Upload Lambda"

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/15 * * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = module.lambda.lambda_out.arn
		role_arn = var.schedule_target_role_arn
		input = jsonencode({
			"source": "aws.scheduler",
			"url_to_invoke": "CUSCOMMUPLOAD_API_URL"
		})

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

resource "aws_scheduler_schedule" "hms_email_archival_schedule" {
	count = var.hermes_email_archival_cuscommupload_api_bool ? 1: 0
	name = var.schedule2_name
	group_name = var.schedule_group_name
	description = "Scheduler to invoke Email Archival & Customer Communication Upload Lambda"

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/10 * * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = module.lambda.lambda_out.arn
		role_arn = var.schedule_target_role_arn
		input = jsonencode({
			"source": "aws.scheduler",
			"url_to_invoke": "EMAIL_ARCHIVAL_API_URL"
		})

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