module "activegate" {
  source = "../../modules/activegate_asg"

  prefix         = "activegate"
  name           = "activegate-${var.environment}"
  amis           = data.aws_ami.ubuntu
  environment    = var.environment
  public_ssh_key = var.public_ssh_key
  min_size       = "2"
  max_size       = "2"
  #count          = length(var.subnet_ids)
  #subnet_ids     = var.subnet_ids[count.index]
  #subnet_ids     = ["var.subnet_ids"]
  subnet_ids     = ["subnet-03ec7dc73f305df6b", "subnet-0aef2d678a1784914"]
  desired_capacity = "2"
  cooldown         = "300"
  instance_type    = "t2.micro"
  region           = var.region
  vpc_id           = var.vpc_id
  allowed_cidr     = ["0.0.0.0/0"]
  # keys_update_frequency = "5 * * * *"

  # eip = "${aws_eip.activegate.public_ip}"
  additional_user_data_script = <<EOF
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 associate-address --region $REGION --instance-id $INSTANCE_ID --allocation-id ${module.activegate.eip_allocation_id}
EOF
}

