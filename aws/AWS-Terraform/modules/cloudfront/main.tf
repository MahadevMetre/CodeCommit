resource "aws_cloudfront_distribution" "myCfDistro" {
	aliases							= var.cf_aliases
	origin {
		domain_name					= var.cf_origin_domain_name
		origin_id					= var.cf_origin_origin_id

		custom_origin_config {
			http_port						= var.cf_custom_origin_http_port
			https_port						= var.cf_custom_origin_https_port
			origin_protocol_policy			= var.cf_custom_origin_origin_protocol_policy
			origin_ssl_protocols			= var.cf_custom_origin_origin_ssl_protocols
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

	default_cache_behavior {
		allowed_methods             = var.cf_dcb_allowed_methods
		cached_methods              = var.cf_dcb_cached_methods
		target_origin_id            = var.cf_dcb_target_origin_id
		compress                    = var.cf_dcb_compress
		viewer_protocol_policy      = var.cf_dcb_viewer_protocol_policy

		forwarded_values {
			query_string					= var.cf_dcb_fv_query_string
			headers							= var.cf_dcb_fv_headers

			cookies {
				forward						= var.cf_dcb_fv_c_forward
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
			restriction_type				= var.cf_r_g_restriction_type
			locations						= var.cf_r_g_locations
		}
	}
}