resource "aws_api_gateway_rest_api" "gateway" {
  count = var.gw_create?1:0
  name 			= var.gw_name
  description 	= var.gw_desc

  endpoint_configuration {
    types = var.gw_endpoint_types
  }
}

resource "aws_api_gateway_resource" "root" {
  count = var.gw_create?1:0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id
  parent_id = aws_api_gateway_rest_api.gateway[0].root_resource_id
  path_part = var.gw_path
}

resource "aws_api_gateway_deployment" "deployment" {
  count = var.gw_create?1:0
  rest_api_id = aws_api_gateway_rest_api.gateway[0].id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.gateway[0].body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_gw-stage" {
  count = var.gw_create?1:0
  deployment_id = aws_api_gateway_deployment.deployment[0].id
  rest_api_id   = aws_api_gateway_rest_api.gateway[0].id
  stage_name    = var.gw_stage
}