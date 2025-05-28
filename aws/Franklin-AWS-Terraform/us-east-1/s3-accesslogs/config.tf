# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  required_providers {
    aws  = "~> 3.74.2"
  }
  backend "s3" {
    bucket = "franklin-prod-platformconfig"
    key    = "us-east-1/alb_log_bucket/prod/terraform.tfstate"
    region = "us-east-1"
  }
}

# qa
# pci
# prod