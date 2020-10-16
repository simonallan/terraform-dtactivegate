variable "region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1) defined in env tfvars"
  default     = ""
}

variable "name" {
  default = ""
}

variable "environment" {
  default   = ""
}

variable "vpc_id" {
  default  = ""
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
