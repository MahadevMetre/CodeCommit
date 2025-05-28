# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-dev-platformconfig"
    key    = "us-east-1/launch-config/digital_nginx_node/terraform.tfstate"
    region = "us-east-1"
  }
}

# digital_jboss_slave
# jboss_slave
# digital_nginx_node