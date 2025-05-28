resource "aws_cloudwatch_event_rule" "hms_file_processing_api_rule" {
	count = var.hermes_file_processing_api_bool ? 1: 0
	name = var.eb_rule_name
	tags = var.eb_rule_tags
	state = "DISABLED"

	event_pattern = jsonencode(var.eb_rule_event_pattern)
	// Ignore any changes made to the variable state
	lifecycle {
		ignore_changes = [state]
	}
}

resource "aws_cloudwatch_event_target" "hms_file_processing_api_target" {
	count = var.hermes_file_processing_api_bool ? 1: 0
	rule = aws_cloudwatch_event_rule.hms_file_processing_api_rule[0].name
	arn = module.lambda.lambda_out.arn

	retry_policy {
		maximum_event_age_in_seconds = 60
		maximum_retry_attempts = 0
	}

	dead_letter_config {
		arn = var.sqs_dlq_arn
	}
}

resource "aws_lambda_permission" "hms_file_processing_api_eb_permission" {
	count = var.hermes_file_processing_api_bool ? 1: 0
	statement_id  = "AllowExecutionFromEventBridge"
	action        = "lambda:InvokeFunction"
	function_name = module.lambda.lambda_out.arn
	principal     = "events.amazonaws.com"
	source_arn    = aws_cloudwatch_event_rule.hms_file_processing_api_rule[0].arn
}