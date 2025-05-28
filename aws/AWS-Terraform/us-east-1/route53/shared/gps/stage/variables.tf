variable "zone_id" {}

variable "name" {}

variable "type" {}

variable "ttl" {}

variable "records" {
    type = list(string)
    default =[]
}