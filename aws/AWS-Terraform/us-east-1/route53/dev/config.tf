# Configuration of the terraform state file backend
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-dev-platformconfig"
    key    = "us-east-1/route53/argocdnonprods/terraform.tfstate"
    region = "us-east-1"
  }
}
