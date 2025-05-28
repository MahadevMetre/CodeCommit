resource "aws_cloudfront_distribution" "myCfDistro" {
	aliases							= var.cf_aliases
	origin {
		domain_name					= var.cf_origin_domain_name
		origin_id					= var.cf_origin_origin_id

		s3_origin_config {
			origin_access_identity	= var.cf_s3_origin_config_oai
		}
	}

	/*logging_config {
		bucket						= var.cf_logging_config_bucket
		prefix						= var.cf_logging_config_prefix
		include_cookies				= var.cf_logging_config_include_cookies
	}*/

	http_version					= var.cf_http_version
	enabled							= var.cf_enabled
	is_ipv6_enabled					= var.cf_is_ipv6_enabled
	default_root_object				= var.cf_default_root_object
	comment							= var.cf_comment

	default_cache_behavior {
		allowed_methods             = var.cf_dcb_allowed_methods
		cached_methods              = var.cf_dcb_cached_methods
		target_origin_id            = var.cf_dcb_target_origin_id
		compress                    = var.cf_dcb_compress
		viewer_protocol_policy      = var.cf_dcb_viewer_protocol_policy
		default_ttl					= var.cf_dcb_default_ttl
		min_ttl						= var.cf_dcb_min_ttl
		max_ttl						= var.cf_dcb_max_ttl

		forwarded_values {
			query_string			= var.cf_dcb_fv_query_string

			cookies {
				forward				= var.cf_dcb_fv_c_forward
			}
		}
	}

	viewer_certificate {
		acm_certificate_arn			= var.cf_vc_acm_certificate_arn
		minimum_protocol_version	= var.cf_vc_minimum_protocol_version
		ssl_support_method			= var.cf_vc_ssl_support_method
	}

	price_class						= var.cf_price_class

	restrictions {
		geo_restriction {
			restriction_type		= var.cf_r_g_restriction_type
			locations				= var.cf_r_g_locations
		}
	}

	custom_error_response {
		error_caching_min_ttl		= var.cf_cer_error_caching_min_ttl
		error_code					= var.cf_cer_error_code
		response_code				= var.cf_cer_response_code
		response_page_path			= var.cf_cer_response_page_path
	}

	tags							= var.cf_tags
}