resource "aws_instance" "public-instance1" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "${var.instance_type}"
  associate_public_ip_address = true
  subnet_id = values(aws_subnet.public_subnet)[0].id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  tags = {
    "Name" = "${var.env}-public-instance" 
  }
}