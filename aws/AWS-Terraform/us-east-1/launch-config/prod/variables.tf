variable "config_name" {}

variable "image_id" {}

variable "instance_type" {}

variable "key_name" {}

variable "security_groups"{
  type = list(string)
  default = []
}

variable "associate_public_ip_address"{
  default     = false
}

variable "enable_monitoring"{
  default     = false
}

variable "ebs_optimized"{
  default     = false
}

variable "root_size" {
    default = 10
}

variable "root_volume_type" {}

variable "root_encrypted"{
  default     = false
}

variable "device_name" {}

variable "ebs_volume" {}

variable "ebs_delete"{
  default     = false
}

variable "ebs_encrypted"{
  default     = false
}

variable "ebs_volume_type" {} 

variable iam_instance_profile {}