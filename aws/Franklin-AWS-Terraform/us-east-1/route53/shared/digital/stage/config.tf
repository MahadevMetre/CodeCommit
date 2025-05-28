# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/digital/route53/stage/digitalmtservices/terraform.tfstate"
    region = "us-east-1"
  }
}

# ENV - stage
# stage/digitalmtservices
# stage/digitalselfservice
# stage/mtservicesapps
# stage/selfserviceapi
# stage/uiinsuranceapps
# stage/marketingserviceapi