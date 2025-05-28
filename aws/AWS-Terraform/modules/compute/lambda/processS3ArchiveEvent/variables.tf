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
  type = list(string)
  default = []
}
variable "security_group_ids"{
  type = list(string)
  default = []
}

variable "sqs_url"{}

variable "s3_bucket_arn_list"{
  type = list(string)
  default = []
}

variable "sqs_arn_list"{
  type = list(string)
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}