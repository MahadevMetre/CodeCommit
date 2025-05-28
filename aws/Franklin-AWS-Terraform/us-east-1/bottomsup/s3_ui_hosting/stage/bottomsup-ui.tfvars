cf_oai_comment	= "OAI for BottomsUp S3 UI Bucket Stage"

s3b_short_name					= "bottomsup-ui"
s3b_environment					= "stage"
s3b_logging_bucket_name			= "franklin-stage-s3-access-logs"
s3b_logging_bucket_base_prefix	= "bottomsup-ui"
s3b_acl							= "private"
s3b_tags = {
	    "ApplicationName": "Bottomsup",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "sbose",
        "CreatedOn": "01172023",
        "DataClassification": "Low",
        "Department": "Bottomsup",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
s3b_cloudfront_oai_policy		= true

cf_aliases							= ["bottomsup-stage.franklinmadisonds.com"]
cf_logging_config_bucket			= "DUMMY_VALUE_TO_BE_UPDATED"
cf_logging_config_prefix			= "DUMMY_VALUE_TO_BE_UPDATED_NEXT_ONE_ALSO"
cf_logging_config_include_cookies	= true
cf_http_version						= "http2"
cf_enabled							= true
cf_is_ipv6_enabled					= true
cf_default_root_object				= "index.html"
cf_comment							= "BottomsUp UI App Stage"
cf_dcb_allowed_methods				= ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
cf_dcb_cached_methods				= ["GET", "HEAD", "OPTIONS"]
cf_dcb_compress						= true
cf_dcb_viewer_protocol_policy		= "redirect-to-https"
cf_dcb_default_ttl					= 300
cf_dcb_min_ttl						= 300
cf_dcb_max_ttl						= 300
cf_dcb_fv_query_string				= false
cf_dcb_fv_c_forward					= "none"
cf_vc_acm_certificate_arn			= "arn:aws:acm:us-east-1:702230634984:certificate/3bd02586-0e4a-430c-ba8a-2e919813073a"
cf_vc_minimum_protocol_version		= "TLSv1.2_2021"
cf_vc_ssl_support_method			= "sni-only"
cf_price_class						= "PriceClass_100"
cf_r_g_restriction_type				= "whitelist"
cf_r_g_locations					= ["IN", "US"]
cf_cer_error_caching_min_ttl		= "30"
cf_cer_error_code					= "403"
cf_cer_response_code				= "200"
cf_cer_response_page_path			= "/index.html"
cf_tags = {
	    "ApplicationName": "Bottomsup",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "sbose",
        "CreatedOn": "01172023",
        "DataClassification": "Low",
        "Department": "Bottomsup",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}

r53_zone_id	= "Z010407314HT5G1PGDENW"
r53_name	= "bottomsup-stage.franklinmadisonds.com"
r53_type	= "CNAME"
r53_ttl		= 300