module "security_group_rule" {
  source = "../../../modules/sg_rule"
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = var.security_group_id
  description       = var.description 
}
