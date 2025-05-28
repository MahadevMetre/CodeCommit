
variable "file_name"{}
variable "function_name"{}
variable "handler"{}
variable "runtime"{}
variable "source_code_hash"{}
variable "memory_size"{}
variable "timeout"{}
variable "kms_key_arn"{}
variable "env" {}
variable "subnet_ids"{
  type = "list"
  default = []
}
variable "security_group_ids"{
  type = "list"
  default = []
}

variable "environment"{
  type = "list"
  default = []
}

variable "s3_bucket_arn_list"{
  type = "list"
  default = []
}

variable "sqs_arn_list"{
  type = "list"
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = "map"
  default = {
    "terraform" = "True"
  }
}