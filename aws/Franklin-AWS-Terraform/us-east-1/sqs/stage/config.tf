# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key=""
  secret_key=""
  token=""
}

terraform {
  backend "s3" {
    bucket = "franklin-stage-platformconfig"
    key    = "us-east-1/sqs/UPDATE_ME/terraform.tfstate"
    region = "us-east-1"
  }
}

# gps_printpo_sqs_incoming
# gps_printpo_sqs_error
# athenanextgen_upr_sqs_incoming
# athenanextgen_upr_sqs_error
# athenanextgen_cc_dashboard_incoming
# athenanextgen_cc_dashboard_error
# nemesysnextgen_job_bulk_copy_incoming
# nemesysnextgen_job_bulk_copy_error