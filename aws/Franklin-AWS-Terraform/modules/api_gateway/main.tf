resource "aws_apigatewayv2_domain_name" "my_custom_domain" {
	domain_name					= var.apigw_cd_domain_name
	domain_name_configuration {
		certificate_arn			= var.apigw_cd_dnc_certificate_arn
		endpoint_type			= var.apigw_cd_dnc_endpoint_type
		security_policy			= var.apigw_cd_dnc_security_policy
	}
	tags						= var.apigw_cd_tags
}

resource "aws_apigatewayv2_api_mapping" "my_api_mapping" {
	api_id		= var.apigw_mapping_api_id
	domain_name	= var.apigw_cd_domain_name
	stage		= var.apigw_mapping_stage
}

module "route53" {
	source	= "../route53/"
	zone_id	= var.r53_zone_id
	name	= var.apigw_cd_domain_name
	type	= "CNAME"
	ttl		= "300"
	records	= ["${aws_apigatewayv2_domain_name.my_custom_domain.domain_name_configuration[0].target_domain_name}"]
}