resource "aws_lb_target_group" "app-tg" {
  name     = "${var.env}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    "Name" = "${var.env}-tg" 
  }
}

resource "aws_lb_listener" "app-tg-listner" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-tg.arn
  }
  tags = {
    "Name" = "${var.env}-tg-listener"
  }
}