module "security_group" {
	source				= "../../../modules/networking/securitygroups"
	name				= var.sg_name
	description			= var.sg_description
	vpc_id				= var.sg_vpc_id
	sg_ingress_rules	= var.sg_ingress_rules
	tags				= var.sg_tags
}