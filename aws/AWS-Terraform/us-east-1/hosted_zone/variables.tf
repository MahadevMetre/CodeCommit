variable "vpc_id" {}

variable "domain_name" {}

variable "comment" {
	default = "Managed by Terraform"
}

variable "tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}