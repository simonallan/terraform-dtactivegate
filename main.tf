provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/allan05/.aws/credentials"
  profile                 = "terra-dev"
}

resource "aws_instance" "activegate" {
  ami                    = "ami-0823c236601fef765"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_oneagent.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > index.html
              nohup busybox httpd -f -p 9999 &
              EOF

  tags = {
    Name = "activegate"
  }
}

resource "aws_security_group" "allow_oneagent" {
  name        = "allow_oneagent"
  description = "Allow OneAgent traffic inbound"

  ingress {
    from_port   = 9999
    to_port     = 9999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


