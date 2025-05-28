output "event_rule_arn" {
  value  = aws_cloudwatch_event_rule.rule.arn
}

output "api_destination_arn" {
  value  = aws_cloudwatch_event_api_destination.api_destination.arn
}

output "connection_arn" {
  value  = aws_cloudwatch_event_connection.connection.arn
}
