provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/allan05/.aws/credentials"
  profile                 = "terra-dev"
}

resource "aws_instance" "activegate" {
  ami           = "ami-0823c236601fef765"
  instance_type = "t2.micro"

  tags = {
    Name = "activegate"
  }
}
