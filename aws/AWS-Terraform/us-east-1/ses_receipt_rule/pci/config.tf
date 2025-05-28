# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-dev-platformconfig"
    key    = "us-east-1/ses/hermes-archive-cpkt-pci/terraform.tfstate"
    region = "us-east-1"
  }
}
