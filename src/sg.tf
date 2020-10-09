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