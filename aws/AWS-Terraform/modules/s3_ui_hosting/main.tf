module "cf_oai" {
	source	= "../cloudfront/oai/"
	comment	= var.cf_oai_comment
}

module "s3_bucket" {
	source						= "../storage/s3/s3-bucket/"
	s3_bucketName				= var.s3b_short_name
	environment					= var.s3b_environment
	s3_logging_bucketName		= var.s3b_logging_bucket_name
	logging_bucket_base_prefix	= var.s3b_logging_bucket_base_prefix
	acl							= var.s3b_acl
	tags						= var.s3b_tags
	cloudfront_oai_policy		= var.s3b_cloudfront_oai_policy
	cloudfront_oai_arn			= module.cf_oai.cf_oai_output.iam_arn
}

module "cloudfront" {
	source								= "../cloudfront/s3-origin/"
	cf_aliases							= var.cf_aliases
	cf_origin_domain_name				= "${module.s3_bucket.s3_bucket_output.id}.s3.${module.s3_bucket.s3_bucket_output.region}.amazonaws.com"
	cf_origin_origin_id					= "${module.s3_bucket.s3_bucket_output.id}.s3.${module.s3_bucket.s3_bucket_output.region}.amazonaws.com"
	cf_s3_origin_config_oai				= module.cf_oai.cf_oai_output.cloudfront_access_identity_path
	cf_logging_config_bucket			= var.cf_logging_config_bucket
	cf_logging_config_prefix			= var.cf_logging_config_prefix
	cf_logging_config_include_cookies	= var.cf_logging_config_include_cookies
	cf_http_version						= var.cf_http_version
	cf_enabled							= var.cf_enabled
	cf_is_ipv6_enabled					= var.cf_is_ipv6_enabled
	cf_default_root_object				= var.cf_default_root_object
	cf_comment							= var.cf_comment
	cf_dcb_allowed_methods				= var.cf_dcb_allowed_methods
	cf_dcb_cached_methods				= var.cf_dcb_cached_methods
	cf_dcb_target_origin_id				= "${module.s3_bucket.s3_bucket_output.id}.s3.${module.s3_bucket.s3_bucket_output.region}.amazonaws.com"
	cf_dcb_compress						= var.cf_dcb_compress
	cf_dcb_viewer_protocol_policy		= var.cf_dcb_viewer_protocol_policy
	cf_dcb_default_ttl					= var.cf_dcb_default_ttl
	cf_dcb_min_ttl						= var.cf_dcb_min_ttl
	cf_dcb_max_ttl						= var.cf_dcb_max_ttl
	cf_dcb_fv_query_string				= var.cf_dcb_fv_query_string
	cf_dcb_fv_c_forward					= var.cf_dcb_fv_c_forward
	cf_vc_acm_certificate_arn			= var.cf_vc_acm_certificate_arn
	cf_vc_minimum_protocol_version		= var.cf_vc_minimum_protocol_version
	cf_vc_ssl_support_method			= var.cf_vc_ssl_support_method
	cf_price_class						= var.cf_price_class
	cf_r_g_restriction_type				= var.cf_r_g_restriction_type
	cf_r_g_locations					= var.cf_r_g_locations
	cf_cer_error_caching_min_ttl		= var.cf_cer_error_caching_min_ttl
	cf_cer_error_code					= var.cf_cer_error_code
	cf_cer_response_code				= var.cf_cer_response_code
	cf_cer_response_page_path			= var.cf_cer_response_page_path
	cf_tags								= var.cf_tags
}

module "route53" {
	source	= "../route53/"
	zone_id	= var.r53_zone_id
	name	= var.r53_name
	type	= var.r53_type
	ttl		= var.r53_ttl
	records	= ["${module.cloudfront.cf_output.domain_name}"]
}