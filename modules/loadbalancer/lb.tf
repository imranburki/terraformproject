resource "aws_lb" "app-lb" {
  name               = "${var.env}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_sg.id]
  subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]

  enable_deletion_protection = true

  tags = {
    Environment = "${var.env}-loadbalancer"
  }
}