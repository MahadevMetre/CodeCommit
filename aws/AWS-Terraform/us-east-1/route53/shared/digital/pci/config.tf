# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "franklin-shared-platformconfig"
    key    = "us-east-1/digital/route53/pci/digitalselfservice_domain_www_cname/terraform.tfstate"
    region = "us-east-1"
  }
}

# digitalmtservices
# digitalselfservice
# digitalselfservice_cname
# digitalselfservice_domain_a
# digitalselfservice_domain_www_cname
# marketingserviceapi
# marketingserviceapi_domain
# mtservicesapps
# selfserviceapi
# selfserviceapi_domain
# fmservice_ses_1
# fmservice_ses_2
# fmservice_ses_3