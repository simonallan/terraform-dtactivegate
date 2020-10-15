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
  default     = ""
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
