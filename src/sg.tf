resource "aws_security_group" "allow_dynatrace_traffic_inbound" {
  description = "Allow OneAgent traffic inbound"

  ingress {
    from_port   = var.dynatrace_ports.oneagent
    to_port     = var.dynatrace_ports.oneagent
    protocol    = var.dynatrace_protocol
    cidr_blocks = var.dynatrace_ext_in_CIDR
  }

  ingress {
    from_port   = var.dynatrace_ports.activegate
    to_port     = var.dynatrace_ports.activegate
    protocol    = var.dynatrace_protocol
    cidr_blocks = var.dynatrace_ext_in_CIDR
  }

  tags = merge(
    local.common_tags,
    {
      Name = ${"allow_dynatrace_traffic_inbound"}
    }
}