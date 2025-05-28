module "apigw_custom_domain" {
	source							= "../../../modules/api_gateway/"
	apigw_cd_domain_name			= var.apigw_cd_domain_name
	apigw_cd_dnc_certificate_arn	= var.apigw_cd_dnc_certificate_arn
	apigw_cd_dnc_endpoint_type		= var.apigw_cd_dnc_endpoint_type
	apigw_cd_dnc_security_policy	= var.apigw_cd_dnc_security_policy
	apigw_cd_tags					= var.apigw_cd_tags
	apigw_mapping_api_id	= var.apigw_mapping_api_id
	apigw_mapping_stage		= var.apigw_mapping_stage
	r53_zone_id	= var.r53_zone_id
}