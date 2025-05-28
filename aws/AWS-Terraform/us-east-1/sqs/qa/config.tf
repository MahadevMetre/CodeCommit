# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-qa-platformconfig"
    key    = "us-east-1/sqs/athenanextgen_cc_dashboard_incoming/terraform.tfstate"
    region = "us-east-1"
  }
}

# athenanextgen_cc_dashboard_incoming
# athenanextgen_cc_dashboard_error