# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/route53/gps/pci/uiapps/terraform.tfstate"
    region = "us-east-1"
  }
}

# mtservices
# uiapps