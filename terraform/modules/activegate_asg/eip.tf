resource "aws_eip" "activegate" {
  vpc = true
}

output "eip_allocation_id" {
  value = aws_eip.activegate.id
}

output "eip_public_ip" {
  value = aws_eip.activegate.public_ip
}

