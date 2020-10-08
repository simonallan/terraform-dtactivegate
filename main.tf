provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/allan05/.aws/credentials"
  profile                 = "terra-dev"
}

variable "product_name" {
  description = "Name of application being deployed"
  type        = string
  default     = "dtactivegate"
}

variable "environment" {
  description = "Describes business criticality of this deployment"
  type        = string
  default     = "dev"
}

variable "instance_count" {
  description = "An index to count instances"
  type        = number
  default     = "1"
}

variable "dynatrace_ports" {
  description = "Default Ports used for Dynatrace traffic"
  type        = map
  default = {
    oneagent   = 9999
    activegate = 443
  }
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

resource "aws_instance" "dtactivegate_instance" {
  count                  = var.instance_count
  ami                    = "ami-0823c236601fef765"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_dynatrace_traffic_inbound.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > index.html
              nohup busybox httpd -f -p 9999 &
              EOF

  tags = merge(
    local.common_tags,
    {
      Name = "${local.deployment_name}-${count.index + 1}"
    }
  )
}

resource "aws_security_group" "allow_dynatrace_traffic_inbound" {
  name        = "allow_dynatrace_traffic_inbound"
  description = "Allow OneAgent traffic inbound"

  ingress {
    from_port   = var.dynatrace_ports.oneagent
    to_port     = var.dynatrace_ports.oneagent
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.dynatrace_ports.activegate
    to_port     = var.dynatrace_ports.activegate
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
