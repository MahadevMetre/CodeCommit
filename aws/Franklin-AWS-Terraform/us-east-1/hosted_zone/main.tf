module "hosted_zone" {
	source = "../../modules/route53/hosted_zone"
	domain_name = var.domain_name
	comment = var.comment
	tags = var.tags
	vpc_id = var.vpc_id
}