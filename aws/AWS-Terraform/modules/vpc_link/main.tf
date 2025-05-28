resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = var.name
  target_arns = var.target_arns
  description = var.description

  tags = var.tags
}
