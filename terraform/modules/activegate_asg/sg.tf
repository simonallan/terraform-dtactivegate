resource "aws_security_group" "activegate" {
  name        = var.name
  vpc_id      = var.vpc_id
  description = "Allow OneAgent traffic inbound"

  tags = {
    Name = var.name
  }

  # tags = merge(
  #   local.common_tags,
  #   {
  #     Name = "allow_dynatrace_traffic_in-${var.environment}"
  #   }
  # )
}

resource "aws_security_group_rule" "oneagent-ingress" {
  type              = "ingress"
  from_port         = var.dynatrace_ports.oneagent
  to_port           = var.dynatrace_ports.oneagent
  protocol          = var.dynatrace_protocol
  cidr_blocks       = var.allowed_cidr
  ipv6_cidr_blocks  = var.allowed_ipv6_cidr
  security_group_id = aws_security_group.activegate.id
}

resource "aws_security_group_rule" "activegate-ingress" {
  type              = "ingress"
  from_port         = var.dynatrace_ports.activegate
  to_port           = var.dynatrace_ports.activegate
  protocol          = var.dynatrace_protocol
  cidr_blocks       = var.allowed_cidr
  ipv6_cidr_blocks  = var.allowed_ipv6_cidr
  security_group_id = aws_security_group.activegate.id
}

resource "aws_security_group_rule" "sg_ingress" {
  count                    = length(var.allowed_security_groups)
  type                     = "ingress"
  from_port                = var.dynatrace_ports.oneagent
  to_port                  = var.dynatrace_ports.oneagent
  protocol                 = var.dynatrace_protocol
  source_security_group_id = element(var.allowed_security_groups, count.index)
  security_group_id        = aws_security_group.activegate.id
}

resource "aws_security_group_rule" "activegate_all_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "65535"
  protocol  = "all"

  cidr_blocks = [
    "0.0.0.0/0",
  ]

  ipv6_cidr_blocks = [
    "::/0",
  ]

  security_group_id = aws_security_group.activegate.id
}


