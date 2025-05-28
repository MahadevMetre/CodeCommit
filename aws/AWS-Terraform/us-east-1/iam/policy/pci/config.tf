# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-pci-platformconfig"
    key    = "us-east-1/iam-policy/digital-cognito-admin/terraform.tfstate"
    region = "us-east-1"
  }
}

# digital-cognito-admin