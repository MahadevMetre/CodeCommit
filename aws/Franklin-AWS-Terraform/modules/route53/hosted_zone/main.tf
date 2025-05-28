resource "aws_route53_zone" "hosted_zone" {
	name = var.domain_name
	comment = var.comment
	tags = var.tags
	vpc {
		vpc_id = var.vpc_id
	}
}