variable "efs_name" {}

variable "efs_perf_mode" {}

variable "efs_throughput_mode" {}

variable "efs_encrypted" {
    type = bool
}

variable "efs_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable kms_key_id {}

variable "subnet_id" {}

variable "efs_attach_to_second_subnet" {
    type = bool
    default = false
}

variable "subnet2_id" {
	default = ""
}

variable "efs_security_group_name" {}

variable vpc_id {}

variable "sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map
  default = {}
}

variable "efs_sg_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}