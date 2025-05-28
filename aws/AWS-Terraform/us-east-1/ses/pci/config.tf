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
    key    = "us-east-1/ses/hermes_ses_config_set_BDOS/terraform.tfstate"
    region = "us-east-1"
  }
}
