
resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "${var.env}-public_routetable"
  }
}
resource "aws_route_table" "private_routetable" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.net_gw.id
  }

  tags = {
    Name = "${var.env}-private_routetable"
  }
}

resource "aws_route_table_association" "public_routetable_assoc" {
  route_table_id = aws_route_table.public_routetable.id
  for_each = aws_subnet.public_subnet
  subnet_id = each.value.id
}

resource "aws_route_table_association" "private_routetable_assoc" {
  route_table_id = aws_route_table.private_routetable.id
  for_each = aws_subnet.private_subnet
  subnet_id = each.value.id
}