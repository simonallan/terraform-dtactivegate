resource "aws_key_pair" "activegate" {
  key_name_prefix = "${var.prefix}-"
  public_key      = var.public_ssh_key
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.prefix}-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.activegate.key_name

  # security_group_id           = ""
  security_groups = compact(
    concat(
      [aws_security_group.activegate.id],
      split(",", var.security_group_ids),
    ),
  )
  iam_instance_profile        = aws_iam_instance_profile.s3-eip-ssm.name
  user_data                   = data.template_file.user_data.rendered
  associate_public_ip_address = var.associate_public_ip_address
  enable_monitoring           = var.enable_monitoring
  root_block_device {
    delete_on_termination = var.root_block_device_delete
    volume_size           = var.root_block_device_size
    volume_type           = var.root_block_device_type
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "activegate" {
  name_prefix               = "${var.prefix}-"
  max_size                  = var.max_size
  min_size                  = var.min_size
  default_cooldown          = var.cooldown
  launch_configuration      = aws_launch_configuration.as_conf.name
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  termination_policies      = ["ClosestToNextInstanceHour", "OldestInstance", "Default"]
  enabled_metrics           = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
}

