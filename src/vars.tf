variable "region" {
  description = "Default region for this deployment"
  type        = string
  default     = "eu-west-1"
}

variable "shared_credentials_file" {
  description = "Default credentials for deployment user"
  type        = string
  default     = "/home/allan05/.aws/credentials"
}

variable "profile" {
  description = "Default deployment user role"
  type        = string
  default     = "terra-dev"
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

variable "dynatrace_protocol" {
  description = "Default protocol used for Dynatrace traffic"
  type        = string
  default     = "tcp"
}

variable "dynatrace_CIDR_ext_in" {
  description = "Default CIDR used for external Dynatrace traffic ingress"
  type        = string
  default     = "0.0.0.0/0"
}

