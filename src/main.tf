provider "aws" {
  region                  = var.region
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.profile
  version                  = "~> 2.5"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    product     = var.product_name
    environment = var.environment
    owner       = var.owner
    contact     = var.contact
  }
  deployment_name = "${var.product_name}-${var.environment}"
}
