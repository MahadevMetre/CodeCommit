# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/digital/route53/qa/digitalselfservice_domain/terraform.tfstate"
    region = "us-east-1"
  }
}

# digitalmtservices
# digitalselfservice
# digitalselfservice_domain
# marketingserviceapi
# marketingserviceapi_domain
# mtservicesapps
# selfserviceapi
# selfserviceapi_domain
# fmservice_ses_1
# fmservice_ses_2
# fmservice_ses_3