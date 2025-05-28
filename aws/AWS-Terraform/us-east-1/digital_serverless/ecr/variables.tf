variable "repo_name" {
  type = string
}

variable "repo_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}