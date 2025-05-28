variable "cf_aliases" {
  type = list(string)
}

variable "cf_origin_domain_name" {
  type = string
}

variable "cf_origin_origin_id" {
  type = string
}

variable "cf_custom_origin_http_port" {
  type = string
}

variable "cf_custom_origin_https_port" {
  type = string
}

variable "cf_custom_origin_origin_protocol_policy" {
  type = string
}

variable "cf_custom_origin_origin_ssl_protocols" {
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

variable "cf_dcb_allowed_methods" {
  type = list(string)
}

variable "cf_dcb_cached_methods" {
  type = list(string)
}

variable "cf_dcb_target_origin_id" {
  type = string
}

variable "cf_dcb_compress" {
  type = bool
}

variable "cf_dcb_viewer_protocol_policy" {
  type = string
}

variable "cf_dcb_fv_query_string" {
  type = bool
}

variable "cf_dcb_fv_headers" {
  type = list(string)
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