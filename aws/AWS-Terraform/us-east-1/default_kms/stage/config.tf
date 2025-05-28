# Configuration of the terraform state file backend
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-stage-platformconfig"
    key    = "us-east-1/kms/default/terraform.tfstate"
    region = "us-east-1"
  }
}
