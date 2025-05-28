variable "ebs_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "ebs_size" {}

variable "ebs2_size" {
	default = 10
}

variable "volume_type" {}

variable "kms_key_id" {}

variable "ebs_encrypted"{
  default     = false
}

variable "ami" {}

variable "instance_type" {}

variable "ec2_region" {}

variable "public_ip_bool" {
  default = false
}

variable "key_name" {}

variable "security_groups"{
  type = list(string)
  default = []
}

variable "subnet_id" {}

variable "instance_initiated_shutdown_behavior"{
  default = "stop"
}

variable "device_name" {
  type = string
  default = "/dev/sdf"
}

variable "ebs_enabled" {
  type = bool
  default = false
}

variable "root_delete" {
  type = bool
  default = true
}

variable "private_ip" {
  type = string
  default = null
}

variable "bastionhost_iamrole_name" {
  description = "BastionHost Admin Role name"
}
variable "bastionhost_iaminstanceprofile_name" {
  description = "BastionHost Instance Profile"
}
