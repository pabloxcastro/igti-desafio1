provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-igti-iac"
    key = "state/igti/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}