output "ubuntu_1804_ami_id" {
  value = "${data.aws_ami.ubuntu-linux-1804.id}"
}