variable "gw_name" {
  type = string
}

variable "gw_desc" {
  type = string
}

variable "gw_create" {
  type = bool
  default = false
}

variable "gw_endpoint_types" {
  type = list(string)
  default = ["REGIONAL"]
}

variable "gw_path" {
  type = string
  default = "/"
}

variable "gw_stage" {
  type = string
  default = "stage"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}