variable "cf_oai_comment" {
	type = string
}

variable "s3b_short_name" {
  default= ""
}

variable "s3b_logging_bucket_name" {
  default=""
}

variable "s3b_logging_bucket_base_prefix"{
  default = ""
}

variable "s3b_environment" {
  default = ""
}

variable "s3b_acl" {
  default = "private"
}

variable "s3b_tags" {
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "s3b_cloudfront_oai_policy" {
  type = bool
  default = false
}

variable "cf_aliases" {
  type = list(string)
}

variable "cf_logging_config_bucket" {
  type = string
}

variable "cf_logging_config_prefix" {
  type = string
}

variable "cf_logging_config_include_cookies" {
  type = bool
}

variable "cf_http_version" {
  type = string
}

variable "cf_enabled" {
  type = bool
}

variable "cf_is_ipv6_enabled" {
  type = bool
}

variable "cf_default_root_object" {
  type = string
}

variable "cf_comment" {
  type = string
}

variable "cf_dcb_allowed_methods" {
  type = list(string)
}

variable "cf_dcb_cached_methods" {
  type = list(string)
}

variable "cf_dcb_compress" {
  type = bool
}

variable "cf_dcb_viewer_protocol_policy" {
  type = string
}

variable "cf_dcb_default_ttl" {
  type = number
}

variable "cf_dcb_min_ttl" {
  type = number
}

variable "cf_dcb_max_ttl" {
  type = number
}

variable "cf_dcb_fv_query_string" {
  type = bool
}

variable "cf_dcb_fv_c_forward" {
  type = string
}

variable "cf_vc_acm_certificate_arn" {
  type = string
}

variable "cf_vc_minimum_protocol_version" {
  type = string
}

variable "cf_vc_ssl_support_method" {
  type = string
}

variable "cf_price_class" {
  type = string
}

variable "cf_r_g_restriction_type" {
  type = string
}

variable "cf_r_g_locations" {
  type = list(string)
}

variable "cf_cer_error_caching_min_ttl" {
  type = string
}

variable "cf_cer_error_code" {
  type = string
}

variable "cf_cer_response_code" {
  type = string
}

variable "cf_cer_response_page_path" {
  type = string
}

variable "cf_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "r53_zone_id" {}

variable "r53_name" {}

variable "r53_type" {}

variable "r53_ttl" {}