variable "apigw_cd_domain_name" {
  type = string
}

variable "apigw_cd_dnc_certificate_arn" {
  type = string
}

variable "apigw_cd_dnc_endpoint_type" {
  type = string
}

variable "apigw_cd_dnc_security_policy" {
  type = string
}

variable "apigw_cd_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "apigw_mapping_api_id" {
  type = string
}

variable "apigw_mapping_stage" {
  type = string
}

variable "r53_zone_id" {}