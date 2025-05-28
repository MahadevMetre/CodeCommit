# Configuration of the terraform state file backend
provider "aws" {
  region = "us-west-2"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-dr-platformconfig"
    key    = "us-west-2/iam-roles/batch-job-launcher-role/terraform.tfstate"
    region = "us-west-2"
  }
}

# batch-job-launcher-role