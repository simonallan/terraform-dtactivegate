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