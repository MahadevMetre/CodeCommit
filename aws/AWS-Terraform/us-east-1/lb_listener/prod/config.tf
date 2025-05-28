# Configuration of the terraform state file backend
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-pci-platformconfig"
    key    = "us-east-1/lb_listener/jboss/terraform.tfstate"
    region = "us-east-1"
  }
}
