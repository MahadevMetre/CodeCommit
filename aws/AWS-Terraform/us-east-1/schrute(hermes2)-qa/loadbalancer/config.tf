# Configuration of the terraform state file backend
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-qa-platformconfig"
    key    = "us-east-1/alb/jbossapps/terraform.tfstate"
    region = "us-east-1"
  }
}
