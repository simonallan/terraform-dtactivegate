provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/allan05/.aws/credentials"
  profile                 = "terra-dev"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    product     = var.product_name
    environment = var.environment
    owner       = "websysadmins"
    contact     = "websysadmins@cancer.org.uk"
  }
  deployment_name = "${var.product_name}-${var.environment}"
}