output "vpc_cidr" {
  value = aws_vpc.main-vpc.id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.main-igw.id
}