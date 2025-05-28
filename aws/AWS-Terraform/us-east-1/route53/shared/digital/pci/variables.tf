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
	type = string
	default = null
}

variable "alias_zone_id" {
	type = string
	default = null
}

variable "alias_evaluate_target_health" {
  type = bool
  default = false
}