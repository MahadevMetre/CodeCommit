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
    key    = "us-east-1/iam-roles/marketing-lambda-role/terraform.tfstate"
    region = "us-east-1"
  }
}

# batch-job-launcher-role
# digital-lambda-role
# ec2-start-stop-role
# hermes-job-launcher-role
# marketing-lambda-role