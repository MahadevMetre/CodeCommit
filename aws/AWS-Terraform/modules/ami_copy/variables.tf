variable "name" {}

variable "description" {}

variable "source_ami_id" {}

variable "source_ami_region" {}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}