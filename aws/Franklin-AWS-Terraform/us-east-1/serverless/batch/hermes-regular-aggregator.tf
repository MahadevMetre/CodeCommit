resource "aws_batch_compute_environment" "hms_reg_agg_ce" {
	count = var.hermes_regular_aggregator_bool ? 1: 0
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

resource "aws_batch_job_queue" "hms_reg_agg_jq" {
	count = var.hermes_regular_aggregator_bool ? 1: 0
	name					= var.jq_name
	state					= "ENABLED"
	priority				= 1
	compute_environments	= [aws_batch_compute_environment.hms_reg_agg_ce[0].arn]
}

resource "aws_batch_job_definition" "hms_reg_agg_jd" {
	count = var.hermes_regular_aggregator_bool ? 1: 0
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

resource "aws_scheduler_schedule" "hermes_regular_aggregator" {
	count = var.hermes_regular_aggregator_bool ? 1: 0
	name = var.schedule_name
	group_name = var.schedule_group_name
	description = "Scheduler to invoke Hermes Regular Aggregator Job"

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
			JobDefinition	= aws_batch_job_definition.hms_reg_agg_jd[0].arn
			JobName			= var.schedule_job_name
			JobQueue		= aws_batch_job_queue.hms_reg_agg_jq[0].arn
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