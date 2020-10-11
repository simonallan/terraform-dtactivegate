resource "aws_instance" "dtactivegate_instance" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu-linux-1804.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_dynatrace_traffic_in.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "__________________O/________________/|___ _ _ \n ~(*~*)~ hello world :D" > index.html
              nohup busybox httpd -f -p 9999 &
              EOF

  tags = merge(
    local.common_tags,
    {
      Name = "${local.deployment_name}-${count.index + 1}"
    }
  )
}