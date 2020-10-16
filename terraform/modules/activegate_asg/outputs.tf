output "ami_id" {
  value       = data.aws_ami.ubuntu.id
  description = "ID of the selected AMI"
}

output "launch_configuration_id" {
  value       = aws_launch_configuration.as_conf.id
  description = "ID of the activegate's launch configuration"
}

output "launch_configuration_name" {
  value       = aws_launch_configuration.as_conf.name
  description = "Name of the activegate's launch configuration"
}

output "auto_scaling_group_id" {
  value       = aws_autoscaling_group.activegate.id
  description = "ID of the activegate's auto scaling group"
}

output "auto_scaling_group_name" {
  value       = aws_autoscaling_group.activegate.name
  description = "Name of the activegate's auto scaling group"
}

output "ssh_key_name" {
  value       = aws_key_pair.activegate.key_name
  description = "Name of the activegate's SSH key"
}

output "security_group_id" {
  value = aws_security_group.activegate.id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.activegate.id
}

output "kms_key_arn" {
  value = aws_kms_key.mykey.arn
}
output "role_arn" {
  value = aws_iam_role.s3-eip-ssm.arn
}