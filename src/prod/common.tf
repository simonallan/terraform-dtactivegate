provider "aws" {
  region  = "us-east-1"
  version = "~> 2.5"
  # profile = paul.smith
}

# terraform {
#   backend "s3" {
#     bucket  = "sa-terraform-tfstate"
#     key     = "terraform/activegate.tfstate"
#     region  = "us-east-1"
#     profile = "etn-terraform"
#   }
# }

# module "shared_vars" {
#   source = "github.com/anub1s187/core_modules?ref=0.12.6//shared_vars"
# }

