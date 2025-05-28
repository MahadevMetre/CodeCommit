variable "secret_name" {
  type = string
}

variable "secret_description" {
  type = string
}

variable "secret_rc_window" {
  type = string
}

variable "secret_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "secret_values" {
  type = map
  default = {
    "key1" = "value1"
  }
}

variable "sg_name" {}

variable "sg_description" {}

variable "sg_vpc_id" {}

variable "sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map
}

variable "sg_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "rds_proxy_name" {
  type = string
}

variable "rds_proxy_debug_logging" {
  type = bool
}

variable "rds_proxy_engine" {
  type = string
}

variable "rds_proxy_idle_timeout" {
  type = string
}

variable "rds_proxy_tls" {
  type = bool
}

variable "rds_proxy_role_arn" {
  type = string
}

variable "rds_proxy_vpc_subnets" {
  type = list(string)
}

variable "rds_proxy_auth_scheme" {
  type = string
}

variable "rds_proxy_auth_description" {
  type = string
}

variable "rds_proxy_auth_iam" {
  type = string
}

variable "rds_proxy_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "rds_proxy_tg_connection_borrow_timeout" {
  type = string
}

variable "rds_proxy_tg_max_idle_connections_percent" {
  type = string
}

variable "rds_proxy_tg_max_connections_percent" {
  type = string
}

variable "rds_proxy_target_db_identifier" {
  type = string
}