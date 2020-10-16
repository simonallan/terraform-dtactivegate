provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.5"
}

# terraform {
#   backend "s3" {
#     bucket  = "cruk-lz-tfstate"
#     key     = "terraform/activegate.tfstate"
#     region  = "eu-west-2"
#     profile = ""
#   }
# }

