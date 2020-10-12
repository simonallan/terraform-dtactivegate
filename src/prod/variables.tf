variable "region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)"
  default     = "eu-west-1"
}

variable "name" {
  default = ""
}

variable "environment" {
  default   = "dev"
}

variable "vpc_id" {
  default  = "vpc-77403d1f"
}

variable "public_ssh_key" {
  type        = string
  description = "Public half of the SSH key to import into AWS"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC5/0h7TYLKs1R7M+bg7QHq0h7KyjYwCKM83lypiYhYWY3X45wB8boqHFgjawOgBWOKHwj0LwEDj7wnMiGMNgr3JVPBBa9G+ECdlUh/jU97b+hd+ftEKh0n8g+T4ybEl01kb63xyapTuixCO+4LLUPh8xXusdpkwNsDF6pOQvkmPOuMlfWMaozk2SO1a6L/t7SDtEYxhaCvjXyh+xN29eWWJC8fa5wKCooewdLZggSpASRy8OiAuW4l5HAYj3iVHxjq97eYieJ2eVWTGA7TYn9DWFGWfaNqBd9pC0uy2dZnkNkUF+zaWqp2tobcnxy4STXd6fVralaiirU/levAr/d"
}

variable "product_name" {
  description = "Name of application being deployed"
  type        = string
  default     = "dtactivegate"
}

variable "owner" {
  description = "Product Owner"
  type        = string
  default     = "websysadmins"
}

variable "contact" {
  description = "Product owner email address"
  type        = string
  default     = "websysadmins@cancer.org.uk"
}
