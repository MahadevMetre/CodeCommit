variable "repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}

variable "description" {
  description = "The description of the CodeCommit repository"
  type        = string
  default     = "Managed by Terraform"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used for encrypting the repository"
  type        = string
  default     = ""  # Optional: Provide a default KMS ARN or leave it empty to use AWS managed KMS
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
