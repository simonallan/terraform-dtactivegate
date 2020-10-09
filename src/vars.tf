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