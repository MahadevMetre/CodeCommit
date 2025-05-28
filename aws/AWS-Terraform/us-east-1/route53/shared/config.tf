# Configuration of the terraform state file backend
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/route53/automation/terraform.tfstate"
    region = "us-east-1"
  }
}

# bounces_fmservice
# clicks_fmservice
# fmservice_txt_record