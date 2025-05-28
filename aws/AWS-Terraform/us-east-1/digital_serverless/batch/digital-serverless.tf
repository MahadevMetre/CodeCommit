resource "aws_batch_compute_environment" "digital_serverless_ce" {
	count = var.digital_serverless_bool ? 1: 0
	compute_environment_name = var.ce_name

	compute_resources {
		max_vcpus = var.ce_cr_max_vcpus
		security_group_ids = var.ce_cr_sg_list
		subnets = var.ce_cr_subnet_list
		type = var.ce_cr_type
	}

	service_role	= var.ce_service_role
	type			= var.ce_type
	tags			= var.ce_tags
}

resource "aws_batch_job_queue" "digital_serverless_jq" {
	count = var.digital_serverless_bool ? 1: 0
	name					= var.jq_name
	state					= "ENABLED"
	priority				= 1
	compute_environments	= [aws_batch_compute_environment.digital_serverless_ce[0].arn]
}

resource "aws_batch_job_definition" "digital_serverless_jd" {
	count = var.digital_serverless_bool ? 1: 0
	name = var.jd_name
	type = "container"
	platform_capabilities = ["FARGATE"]
	retry_strategy {
		attempts = 3
		evaluate_on_exit {
			action = "RETRY"
			on_status_reason = "Timeout waiting for network interface provisioning to complete."
		}
		evaluate_on_exit {
			action = "RETRY"
			on_status_reason = "Network interface provision complete error timeout wait for network interface provision."
		}
		evaluate_on_exit {
			action = "RETRY"
			on_status_reason = "Rate limit exceeded while preparing network interface to be attached to instance"
		}
		evaluate_on_exit {
			action = "EXIT"
			on_reason = "*"
		}
	}
	timeout {
		attempt_duration_seconds = var.jd_timeout
	}
	container_properties = jsonencode({
		command = var.jd_container_command
		image   = var.jd_container_image
		executionRoleArn = var.jd_container_exec_role_arn
		jobRoleArn = var.jd_container_job_role_arn

		resourceRequirements = [
		{
			type  = "VCPU"
			value = var.jd_container_vcpu
		},
		{
			type  = "MEMORY"
			value = var.jd_container_memory
		}
		]

		logConfiguration = {
			logDriver  = "awslogs"
			options = {}
			secretOptions = []
		}

		secrets = []

		fargatePlatformConfiguration = {
			platformVersion  = "LATEST"
		}

		volumes = []

		environment = var.jd_container_env_vars

		mountPoints = []

		ulimits = []
	})
	tags = var.jd_tags
}

resource "aws_scheduler_schedule" "digital_customer_profile" {
	count = var.digital_customer_profile ? 1: 0
	name = "digital-customer-profile-delete-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/30 * * * ? *)" 
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

resource "aws_scheduler_schedule" "digital_account_update_notification" {
	count = var.digital_account_update ? 1: 0
	name = "digital-account-update-notification-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(0 1 * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

resource "aws_scheduler_schedule" "marketing_regenerate_poe_job" {
	count = var.marketing_regenerate_poe ? 1: 0
	name = "marketing-regenerate-poe-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/5 * * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

resource "aws_scheduler_schedule" "marketing_discard_paperless" {
	count = var.marketing_discard ? 1: 0
	name = "marketing-discard-paperles-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(10 * * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

resource "aws_scheduler_schedule" "marketing_mb_enroll_failure" {
	count = var.marketing_mb_enroll_fail ? 1: 0
	name = "marketing-mb-enroll-fail-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(0 20 * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

resource "aws_scheduler_schedule" "marketing_mb_enroll_job" {
	count = var.marketing_mb_enroll ? 1: 0
	name = "marketing-mb-enroll-job-schedule-${var.digital_schedule_env}"
	group_name = var.schedule_group_name

	flexible_time_window {
		mode = "OFF"
	}

	state = "DISABLED"

	schedule_expression = "cron(*/10 * * * ? *)"
	schedule_expression_timezone = "US/Central"

	target {
		arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
		role_arn = var.schedule_target_role_arn

		input = jsonencode({
			JobDefinition	= aws_batch_job_definition.digital_serverless_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.digital_serverless_jq[0].arn
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

