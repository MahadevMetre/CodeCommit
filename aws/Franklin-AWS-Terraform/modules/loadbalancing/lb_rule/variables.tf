variable "listener_arn" {
    type = string
}

variable "priority" {
    type = number
    default = 1
}

variable "action_type" {
    type = string
    default = "forward"
}

variable "target_group_arn" {
    type = string
}

variable "path_pattern" {
    type = list(string)
    default = ["/*"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}
