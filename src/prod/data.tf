# data "terraform_remote_state" "core" {
#   backend   = "s3"
#   workspace = terraform.workspace

#   config = {
#     bucket  = "sa-terraform-tfstate"
#     key     = "terraform/core.tfstate"
#     region  = "us-east-1"
#     profile = "etn-terraform"
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  owners = ["099720109477"] # Canonical
}

