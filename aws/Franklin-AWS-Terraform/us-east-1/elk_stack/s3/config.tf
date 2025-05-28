# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/elk_stack/s3/elk-backup-bucket/terraform.tfstate"
    region = "us-east-1"
  }
}

# elk-backup-bucket