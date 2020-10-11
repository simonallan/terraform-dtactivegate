resource "aws_security_group" "allow_dynatrace_traffic_in" {
  description = "Allow OneAgent traffic inbound"

  ingress {
    from_port   = var.dynatrace_ports.oneagent
    to_port     = var.dynatrace_ports.oneagent
    protocol    = var.dynatrace_protocol
    cidr_blocks = [var.dynatrace_CIDR_ext_in]
  }

  ingress {
    from_port   = var.dynatrace_ports.activegate
    to_port     = var.dynatrace_ports.activegate
    protocol    = var.dynatrace_protocol
    cidr_blocks = [var.dynatrace_CIDR_ext_in]
  }

  ingress {
    from_port   = var.dynatrace_ports.activegate
    to_port     = var.dynatrace_ports.activegate
    protocol    = var.dynatrace_protocol
    self = true
  }

  ingress {
    from_port   = var.dynatrace_ports.oneagent
    to_port     = var.dynatrace_ports.oneagent
    protocol    = var.dynatrace_protocol
    self = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "allow_dynatrace_traffic_in-${var.environment}"
    }
  )
}
