module "activegate" {
  source = "../modules/activegate_asg"

  # version               = "0.9.0"
  prefix         = "activegate"
  name           = "activegate-${var.environment}"
  amis           = data.aws_ami.ubuntu
  environment    = var.environment
  public_ssh_key = var.public_ssh_key
  min_size       = "3"
  max_size       = "3"
  # subnet_ids     = [data.terraform_remote_state.gigguru.outputs.public_subnet]

  subnet_ids            = ["subnet-0b0fe0e33419ae046", "subnet-0c04f6165ac3f4d9e", "subnet-0f1a4bc124f68f41f"]
  desired_capacity      = "3"
  cooldown              = "300"
  instance_type         = "t2.micro"
  region                = var.region
  vpc_id                = var.vpc_id
  allowed_cidr          = ["62.31.146.220/32"]
  keys_update_frequency = "5 * * * *"

  # eip = "${aws_eip.activegate.public_ip}"
  additional_user_data_script = <<EOF
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 associate-address --region $REGION --instance-id $INSTANCE_ID --allocation-id ${module.activegate.eip_allocation_id}
EOF

}

