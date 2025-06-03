resource "aws_subnet" "public_subnet" {
    for_each = {for public_subnet in var.public_subnet : public_subnet.name=> public_subnet}
    vpc_id = aws_vpc.main-vpc.id
    cidr_block = each.value.cidr
    availability_zone = each.value.zone

    tags={
        name="public subnet"
    } 
}

resource "aws_subnet" "private_subnet" {
  for_each = {for private_subnet in var.private_subnet : private_subnet.name=> private_subnet }
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.zone

  tags = {
    "Name" = "private_subnet"
  }
}

# resource "aws_subnet" "public-subnet" {
#   for_each = {for public_subnet_cidr in var.public_subnet_cidr : public_subnet_cidr.name=> public_subnet}

#   vpc_id     = aws_vpc.main-vpc.id
#   cidr_block = each.value.cidr
#   availability_zone = each.value.zone

#   tags = {
#     Name = "public-subnet"
#   }
# }

# resource "aws_subnet" "private-subnet" {
#   for_each= {for private_subnet_cidr in var.private_subnet_cidr : private_subnet_cidr.name => private_subnet}
#   vpc_id     = aws_vpc.main-vpc.id
#   cidr_block = each.value.cidr
#   availability_zone = each.value.zone

#   tags = {
#     Name = "public-subnet"
#   }
# }