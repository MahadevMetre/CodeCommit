variable "name" {}

variable "load_balancer_type" {}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "subnets" {
    type = list(string)
    default =[]
}

variable "security_groups" {
    type = list(string)
    default =[]
}

variable "enable_deletion_protection" {
    default = true
}