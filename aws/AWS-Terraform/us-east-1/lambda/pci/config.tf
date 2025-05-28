# Configuration of the terraform state file backend
provider "aws" {
  region = "us-east-1"
  access_key="ASIAYYGZUMZNXNQYUR2J"
  secret_key="P4XMmJUTdF0wON1hbdkZywYgIZuEVsr08O4yXnkH"
  token="FwoGZXIvYXdzEEEaDGbFvED72X+N97qM5SKsAcX2c9KrkOAIDqHIutkheY0+aHpqVnS4ot6ND1yUb+BYqsItigx57Fk9ApunNTinU1gtnBngCCMffdEXqsEDlSoLyZTjfwi8gToo9TvrOLfevvKABcjqyDJlxM99X48GBZFGGod1hwx7hHqoX0TkcTRKcn6OKJqyFbYz13HKtvaIrFW4csdtOoDNKZTizG/y/jAm5uuzAsLbV3/jfbXHe57+pLcdBPdubb08m2Uov8qU9AUyLYOUAQlNwzsRBgedE4koj6TW8empu9AXUEtGoSsjuw7mSybXgKCvx2JzlmD2LA=="
}

terraform {
  backend "s3" {
    bucket = "franklin-pci-platformconfig"
    key    = "us-east-1/lambda/processS3ArchiveEvent/terraform.tfstate"
    region = "us-east-1"
  }
}
