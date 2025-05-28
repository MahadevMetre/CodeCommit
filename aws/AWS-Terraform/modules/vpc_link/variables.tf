variable "name" {
  type  = string
}

variable "target_arns" {
  type  = list(string)
}

variable "description" {
  type     = string
  default  = ""
}

variable "tags" {
  type     = map(string)
  default  = {}
}
