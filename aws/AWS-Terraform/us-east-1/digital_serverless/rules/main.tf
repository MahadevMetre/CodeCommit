module "rules" {
  source                     = "../../../modules/rules"
  api_destination_name       = var.api_destination_name
  api_destination_endpoint   = var.api_destination_endpoint
  connection_name            = var.connection_name
  target_id                  = var.target_id
  schedule_expression        = var.schedule_expression
  role_arn                   = var.role_arn
  is_enabled                 = var.is_enabled
  event_pattern              = var.event_pattern
  event_rule_name            = var.event_rule_name
  target_arn                 = var.target_arn
  description                = var.description
  username                   = var.username
  password                   = var.password
  invocation_http_parameters = var.invocation_http_parameters
  rule_tags                  = var.rule_tags
  dlq_arn                    = var.dlq_arn
}