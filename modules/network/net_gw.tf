
resource "aws_eip" "elasticip" {
    tags = {
      "Name" = "${var.env}-ElasticIP" 
    }
}
resource "aws_nat_gateway" "net_gw" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.env}-NAT-GW"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main-igw]
}