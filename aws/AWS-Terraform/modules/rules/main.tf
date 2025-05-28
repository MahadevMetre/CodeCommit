resource "aws_cloudwatch_event_rule" "rule" {
  name                = var.event_rule_name
  event_pattern       = var.event_pattern
  description         = var.description
  schedule_expression = var.schedule_expression
  tags                = var.rule_tags
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.rule.name
  arn       = aws_cloudwatch_event_api_destination.api_destination.arn
  role_arn  = var.role_arn
  target_id = var.target_id

  dead_letter_config {
    arn = var.dlq_arn
  }
  retry_policy {
    maximum_event_age_in_seconds = 86400
    maximum_retry_attempts       = 0  
  }
}

resource "aws_cloudwatch_event_api_destination" "api_destination" {
  name                             = var.api_destination_name
  description                      = var.description
  invocation_endpoint              = var.api_destination_endpoint
  http_method                      = "POST"  
  invocation_rate_limit_per_second = 300
  connection_arn                   = aws_cloudwatch_event_connection.connection.arn
}

resource "aws_cloudwatch_event_connection" "connection" {
  name               = var.connection_name
  description        = var.description
  authorization_type = "BASIC"  

  auth_parameters {
    basic {
      username = var.username
      password = var.password
    }
  }
}
