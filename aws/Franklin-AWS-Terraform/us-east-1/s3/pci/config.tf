# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key="ASIAYYGZUMZNV73GW67K"
  secret_key="ar3bWMt8/WUJwwTYlgT4qKTIVgknlSzepiE08Qcx"
  token="FwoGZXIvYXdzEEIaDI+CiFAMe/C1x5H8XCKsAeCoD4wI5YXKFF1xBvkEJhylsMUsqCVtWkXhYB4j9b0PTwD2jzR1i5ANFiX8F6OoaLbp5FJBGshJT2hLLse0B3mNWW8UnMCEqUwWOML7u9X3wrE7SRjM95rtwo3PRuk3AhVawWfuP3E7XX/WzIAwO97cIQpfiRO+WpGTg29ew3zbs/3NUUn3a9kBVWRUh11t+SoFiQlgAcl2ghbgfOkW2i7EZB8wIzBqKztksHsow+eU9AUyLf5li057zK6sv1KDRpHSQi0A78pIHgbJqEnzXvT7gLZii59qV1vW7gFIIsuRyg=="
}


terraform {
  backend "s3" {
    bucket = "franklin-pci-platformconfig"
    key    = "us-east-1/s3/customercommunications-email-pci/terraform.tfstate"
    region = "us-east-1"
  }
}


