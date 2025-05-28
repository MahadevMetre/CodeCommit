resource "aws_batch_job_definition" "hms_file_processing_basic_t1_jd" {
	count = var.hermes_file_processing_basic_t1_bool ? 1: 0
	name = var.jd_name_basic_t1
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
		attempt_duration_seconds = var.jd_timeout_basic_t1
	}
	container_properties = jsonencode({
		command = var.jd_container_command
		image   = var.jd_container_image
		executionRoleArn = var.jd_container_exec_role_arn
		jobRoleArn = var.jd_container_job_role_arn

		resourceRequirements = [
		{
			type  = "VCPU"
			value = var.jd_container_vcpu_basic_t1
		},
		{
			type  = "MEMORY"
			value = var.jd_container_memory_basic_t1
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
	tags = var.jd_tags_basic_t1
}

resource "aws_cloudwatch_event_rule" "hms_file_processing_basic_t1_rule" {
	count = var.hermes_file_processing_basic_t1_bool ? 1: 0
	name = var.eb_rule_name_basic_t1
	tags = var.eb_rule_tags_basic_t1
	state = "DISABLED"

	event_pattern = jsonencode(var.eb_rule_event_pattern_basic_t1)
	// Ignore any changes made to the variable state
	lifecycle {
		ignore_changes = [state]
	}
}

resource "aws_cloudwatch_event_target" "hms_file_processing_basic_t1_target" {
	count = var.hermes_file_processing_basic_t1_bool ? 1: 0
	rule = aws_cloudwatch_event_rule.hms_file_processing_basic_t1_rule[0].name
	arn = var.event_target_jq_arn
	role_arn = var.event_target_role_arn

	batch_target {
		job_definition	= aws_batch_job_definition.hms_file_processing_basic_t1_jd[0].arn
		job_name		= var.event_target_job_name_basic_t1
	}

	input_transformer {
		input_paths = var.et_transformer_input_paths_basic_t1
		input_template = var.et_transformer_input_template_basic_t1
	}

	retry_policy {
		maximum_event_age_in_seconds = 60
		maximum_retry_attempts = 0
	}

	dead_letter_config {
		arn = var.sqs_dlq_arn
	}
}

// Non-PGP Resource Blocks
resource "aws_cloudwatch_event_rule" "hms_file_processing_basic_t1_rule_non_pgp" {
	count = var.hermes_file_processing_basic_t1_non_pgp_bool ? 1: 0
	name = var.eb_rule_name_basic_t1_non_pgp
	tags = var.eb_rule_tags_basic_t1
	state = "DISABLED"

	event_pattern = jsonencode(var.eb_rule_event_pattern_basic_t1_non_pgp)
	// Ignore any changes made to the variable state
	lifecycle {
		ignore_changes = [state]
	}
}

resource "aws_cloudwatch_event_target" "hms_file_processing_basic_t1_target_non_pgp" {
	count = var.hermes_file_processing_basic_t1_non_pgp_bool ? 1: 0
	rule = aws_cloudwatch_event_rule.hms_file_processing_basic_t1_rule_non_pgp[0].name
	arn = var.event_target_jq_arn
	role_arn = var.event_target_role_arn

	batch_target {
		job_definition	= aws_batch_job_definition.hms_file_processing_basic_t1_jd[0].arn
		job_name		= var.event_target_job_name_basic_t1_non_pgp
	}

	input_transformer {
		input_paths = var.et_transformer_input_paths_basic_t1
		input_template = var.et_transformer_input_template_basic_t1
	}

	retry_policy {
		maximum_event_age_in_seconds = 60
		maximum_retry_attempts = 0
	}

	dead_letter_config {
		arn = var.sqs_dlq_arn
	}
}