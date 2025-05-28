resource "aws_security_group" "security_group" {

  name			= var.name
  description	= var.description
  vpc_id		= var.vpc_id

  egress {
	from_port	= 0
    to_port		= 0
    protocol	= "-1"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  dynamic "ingress" {
	for_each = var.sg_ingress_rules
	content {
		from_port	= ingress.value.from_port
		to_port		= ingress.value.to_port
		protocol	= ingress.value.protocol
		cidr_blocks	= ingress.value.cidr_blocks
		description	= ingress.value.description
	}
  }

  tags	= var.tags
}

resource "aws_vpc_endpoint" "s3_vpce" {
  vpc_id			= var.vpc_id
  service_name		= var.s3_vpce_service_name
  vpc_endpoint_type	= var.vpc_endpoint_type

  security_group_ids	= [aws_security_group.security_group.id]

  subnet_ids	= var.subnet_ids

  tags = var.s3_vpce_tags
}

resource "aws_vpc_endpoint" "sgw_vpce" {
  vpc_id			= var.vpc_id
  service_name		= var.sgw_vpce_service_name
  vpc_endpoint_type	= var.vpc_endpoint_type

  security_group_ids	= [aws_security_group.security_group.id]

  subnet_ids	= var.subnet_ids

  tags = var.sgw_vpce_tags
}