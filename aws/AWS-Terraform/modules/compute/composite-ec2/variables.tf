#EBS Volume
variable "ebs_tags" {
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

variable "ebs_enabled" {
  type = bool
  default = false
}

variable "root_delete" {
  type = bool
  default = true
}

# EC2 - instance
variable "ec2_tags" {
  description = "A map of tags to add to all resources"
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "ami" {}

variable "instance_type" {}

variable "ec2_region" {}

variable "public_ip_bool" {
  default = false
}

variable "key_name" {}

variable "efs_sg"{
  type = list(string)
  default = []
}

variable "subnet_id" {
  type = string
}

variable "instance_initiated_shutdown_behavior" {
  default = "stop"
}

variable "private_ip" {
  type = string
  default = null
}

# SG
variable "sg_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "sg_name" {}

variable "sg_description" {}

variable "vpc_id" {}

variable "sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map
}

# EBS Attachment
variable "device_name" {
  type = string
  default = "/dev/sdf"
}