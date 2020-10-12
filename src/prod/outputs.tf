output "eip_public_ip" {
  value = module.activegate.eip_public_ip
}

# output "ag_public_ip" {
#   description = "DT Activagate public DNS address"
#   value       = aws_instance.dtactivegate_instance[*].public_ip
# }

# output "ag_public_dns" {
#   description = "DT Activagate public DNS address"
#   value       = aws_instance.dtactivegate_instance[*].public_dns
# }

# output "test_url" {
#   description = "Test URL"
#   value       = "http://${aws_instance.dtactivegate_instance[0].public_dns}:${var.dynatrace_ports.oneagent}"
# }