provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-stage-platformconfig"
    key    = "us-east-1/scaling_group_attachment/jboss/terraform.tfstate"
    region = "us-east-1"
  }
}
