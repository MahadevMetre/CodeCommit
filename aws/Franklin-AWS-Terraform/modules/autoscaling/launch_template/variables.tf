variable "template_name" {}

variable "image_id" {}

variable "instance_type" {}

variable "key_name" {}

variable "template_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "associate_public_ip_address" {
  default     = false
}

variable "update_default_version" {
  default     = false
}

/*variable "ebs_optimized" {
  default     = false
}

variable "device_name" {}

variable "ebs_volume" {}

variable "ebs_delete" {
  default     = false
}

variable "ebs_encrypted" {
  default     = false
}

variable "ebs_volume_type" {}*/

variable "launch_template_monitoring" {
  default     = false
}

variable "resource_type" {}

variable "resource_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "lt_security_groups" {
	type			=	list(string)
	default			=	[]
}