variable "type" {
  type = string
}

variable "from_port" {
  type = string
}

variable "to_port" {
  type = string
}

variable "protocol" {
  type = string
}

variable "security_group_id" {
  type = string
}


variable "description" {
  type = string
  default = ""
}

variable "cidr_blocks" {
  type = list(string)
}