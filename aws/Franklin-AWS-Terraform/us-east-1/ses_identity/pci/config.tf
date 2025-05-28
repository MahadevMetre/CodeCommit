# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-pci-platformconfig"
    key    = "us-east-1/digital/composite_ses/fmservice/terraform.tfstate"
    region = "us-east-1"
  }
}

# fmservice