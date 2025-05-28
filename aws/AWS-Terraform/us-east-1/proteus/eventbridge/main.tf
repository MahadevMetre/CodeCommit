resource "aws_cloudwatch_event_rule" "event_rule" {
	name = var.eb_rule_name
	tags = var.tags
    schedule_expression = var.schedule
	is_enabled = false
	// Ignore any changes made to the variable is_enabled
	lifecycle {
		ignore_changes = [is_enabled]
	}
}

resource "aws_cloudwatch_event_target" "event_target_sfn" {
	rule = aws_cloudwatch_event_rule.event_rule.name
	arn = var.stepfunction_arn
	role_arn = var.role
}