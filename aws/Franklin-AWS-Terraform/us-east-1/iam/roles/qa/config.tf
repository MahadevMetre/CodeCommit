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
    key    = "us-east-1/iam-roles/digital-lambda-role/terraform.tfstate"
    region = "us-east-1"
  }
}

# cloudfront-sg-update-lambda
# digital-cognito-admin
# digital-lambda-role
# marketing-lambda-role
# marketing-apigw-logs