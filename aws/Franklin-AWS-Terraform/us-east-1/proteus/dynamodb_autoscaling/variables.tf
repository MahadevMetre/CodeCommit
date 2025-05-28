variable "read_capacity_maximum" {
  description = "Maximum allowed autoscale range."
  type    = number
  default = null
}
variable "read_capacity_minimum" {
  description = "Minimum allowed autoscale range."
  type    = number
  default = null
}

variable "write_capacity_maximum" {
  description = "Maximum allowed autoscale range."
  type    = number
  default = null
}
variable "write_capacity_minimum" {
  description = "Minimum allowed autoscale range."
  type    = number
  default = null
}

variable "dynamodb_table_read_target" {
    type = bool
    default = false
}

variable "dynamodb_table_write_target" {
    type = bool
    default = false
}
