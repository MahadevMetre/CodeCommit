# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-stage-platformconfig"
    key    = "us-east-1/security_groups/jboss_slave/terraform.tfstate"
    region = "us-east-1"
  }
}
