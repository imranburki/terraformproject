resource "aws_placement_group" "ec2-placement" {
  name     = "${var.env}-placementgroup"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "ec2-asg" {
  name                      = "${var.env}-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  target_group_arns = [aws_lb_target_group.app-tg.arn]

  health_check_type         = "EC2"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.test.id
  vpc_zone_identifier = [for subnet in aws_subnet.public_subnet : subnet.id]

  launch_template {
    id      = aws_launch_template.ec2-launch-template.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
}