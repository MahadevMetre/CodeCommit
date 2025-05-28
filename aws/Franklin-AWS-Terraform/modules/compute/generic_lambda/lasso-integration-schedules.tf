resource "aws_scheduler_schedule_group" "lasso" {
	count	= var.lasso_integration_schedules ? 1 : 0
	name	= "lasso-${var.lasso_integration_schedule_env}"
	tags	= var.schedule_group_tags
}

resource "aws_scheduler_schedule" "lasso_integration_reset_sequence" {
	count					= var.lasso_integration_schedules ? 1 : 0
	name					= "lasso_integration_reset_sequence-${var.lasso_integration_schedule_env}"
	group_name				= aws_scheduler_schedule_group.lasso[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(5 0 * * ? *)"
	schedule_expression_timezone = "America/Chicago"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
			"functionMode": "resetSequence"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}

resource "aws_scheduler_schedule" "lasso_integration_memops_mailinduct" {
	count					= var.lasso_integration_schedules ? 1 : 0
	name					= "lasso_integration_memops_mailinduct-${var.lasso_integration_schedule_env}"
	group_name				= aws_scheduler_schedule_group.lasso[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(0/30 * * * ? *)"
	schedule_expression_timezone = "America/Chicago"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
			"functionMode": "memopsMailInduct"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}

resource "aws_scheduler_schedule" "lasso_integration_claims_mailinduct" {
	count					= var.lasso_integration_schedules ? 1 : 0
	name					= "lasso_integration_claims_mailinduct-${var.lasso_integration_schedule_env}"
	group_name				= aws_scheduler_schedule_group.lasso[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(0/15 * * * ? *)"
	schedule_expression_timezone = "America/Chicago"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
			"functionMode": "claimsMailInduct"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}

resource "aws_scheduler_schedule" "lasso_integration_sync_claim_ack_status" {
	count					= var.lasso_integration_schedules ? 1 : 0
	name					= "lasso_integration_sync_claim_ack_status-${var.lasso_integration_schedule_env}"
	group_name				= aws_scheduler_schedule_group.lasso[0].id

	flexible_time_window {
		mode				= "OFF"
	}

	schedule_expression		= "cron(10 0 * * ? *)"
	schedule_expression_timezone = "America/Chicago"

	target {
		arn					= aws_lambda_function.lambda.arn
		role_arn			= var.role
		input				= jsonencode({
			"functionMode": "syncClaimAckStatus"
		})
		retry_policy {
			maximum_event_age_in_seconds = "60"
			maximum_retry_attempts	= "0"
		}
	}
}