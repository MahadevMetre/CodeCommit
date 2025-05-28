variable "zone_id" {}

variable "name" {}

variable "type" {}

variable "ttl" {
    default = 300
}

variable "records" {
    type = list(string)
    default =[]
}

variable "alias_record" {
  type = bool
  default = false
}

variable "alias_name" {
	default = ""
}

variable "alias_zone_id" {
	default = ""
}

variable "alias_evaluate_target_health" {
  type = bool
  default = false
}