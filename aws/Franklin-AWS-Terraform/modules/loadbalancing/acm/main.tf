resource "aws_acm_certificate" "cert" {
	domain_name					=	var.domain_name
	validation_method			=	var.validation
	tags						=	var.tags
	subject_alternative_names	=	var.subject_alternative_names
}