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