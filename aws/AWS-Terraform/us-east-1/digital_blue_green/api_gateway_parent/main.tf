# API Gateway REST API Resource
resource "aws_api_gateway_rest_api" "gateway" {
  count        = var.gw_create ? 1 : 0
  name         = var.gw_name
  description  = var.gw_desc

  endpoint_configuration {
    types = var.gw_endpoint_types
  }
}

# API Gateway Resource (Root)
resource "aws_api_gateway_resource" "root" {
  count       = var.gw_create ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id
  parent_id   = aws_api_gateway_rest_api.gateway[0].root_resource_id
  path_part   = var.gw_path
}

# API Gateway Method for Root Resource (GET)
resource "aws_api_gateway_method" "root_get" {
  count       = var.gw_create ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id
  resource_id = aws_api_gateway_resource.root[0].id
  http_method = "GET"
  authorization = "NONE"
}

# API Gateway Integration for GET Method (MOCK Integration)
resource "aws_api_gateway_integration" "root_get" {
  count       = var.gw_create ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id
  resource_id = aws_api_gateway_resource.root[0].id
  http_method = aws_api_gateway_method.root_get[0].http_method
  integration_http_method = "POST"
  type = "MOCK"
}

# API Gateway Deployment
resource "aws_api_gateway_deployment" "deployment" {
  count       = var.gw_create ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.gateway[0].body))
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_method.root_get,
    aws_api_gateway_integration.root_get
  ]
}

# API Gateway Stage
resource "aws_api_gateway_stage" "api_gw-stage" {
  count         = var.gw_create ? 1 : 0
  deployment_id = aws_api_gateway_deployment.deployment[0].id
  rest_api_id   = aws_api_gateway_rest_api.gateway[0].id
  stage_name    = var.gw_stage
  tags = var.tags

}

# API Gateway Method Settings
resource "aws_api_gateway_method_settings" "method_settings" {
  count        = var.gw_create ? 1 : 0
  rest_api_id  = aws_api_gateway_rest_api.gateway[0].id
  stage_name   = aws_api_gateway_stage.api_gw-stage[0].stage_name
  method_path  = "*/*"  # Apply settings to all methods and resources

  settings {
    logging_level           = "INFO" # Options: OFF, ERROR, INFO
    data_trace_enabled     = true    # Enable full request and response logs
    metrics_enabled        = true    # Enable detailed metrics
    throttling_rate_limit  = 10000  # Set the rate limit (requests per second)
    throttling_burst_limit = 5000   # Set the burst limit (maximum number of requests in a short period)
    caching_enabled        = false  # Set to true if caching is enabled
    cache_ttl_in_seconds   = 0      # TTL for caching, if enabled
  }
}

