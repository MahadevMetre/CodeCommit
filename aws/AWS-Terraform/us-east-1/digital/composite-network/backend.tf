# Do not rename this file

terraform {
  required_providers {
    aws  = "~> 4.67.0"
  }
	backend "s3" {
		region = "us-east-1"
	}
}