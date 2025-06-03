resource "aws_launch_template" "ec2-launch-template" {
  name = "${var.env}-launchtemplate"
  disable_api_stop        = true
  disable_api_termination = true

  ebs_optimized = true

  iam_instance_profile {
    name = "${var.env}-instanceprofile"
  }

  image_id = "ami-0a7d80731ae1b2435"

  instance_initiated_shutdown_behavior = "terminate"

  instance_market_options {
    market_type = "spot"
  }

  instance_type = "${var.env}-instance"
  license_specification {
    license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.ec2-sg.id]
  }

  placement {
    availability_zone = "us-east-1a"
  }


  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.env}-app-launchtemplate"
    }
  }

  user_data = filebase64("ec2-configuration.sh")
}