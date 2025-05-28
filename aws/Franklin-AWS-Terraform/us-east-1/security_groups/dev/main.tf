module "security_group" {
    source ="../../../modules/networking/securitygroups/"
    name                = var.name
    description         = var.description
    vpc_id              = var.vpc_id
    tags                = var.tags
    sg_ingress_rules    = var.sg_ingress_rules
}