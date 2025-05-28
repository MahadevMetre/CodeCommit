variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "name" {}

variable "source_instance_id" {}