variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "name" {}

variable "description" {}

variable "vpc_id" {}

variable "sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map
}

variable "s3_vpce_service_name" {}

variable "sgw_vpce_service_name" {}

variable "vpc_endpoint_type" {}

variable "subnet_ids" {
  type	= list(string)
}

variable "s3_vpce_tags" {
  type = map(string)
}

variable "sgw_vpce_tags" {
  type = map(string)
}